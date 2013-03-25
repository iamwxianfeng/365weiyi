#coding:utf-8
require 'digest/sha1'
class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_many :orders
  has_many :measures
  has_one :event
  has_many :inquiries
  has_many :measurements
  has_many :places
  has_many :reserve_rulers
  has_many :reserves , :foreign_key=>"reserve_id", :class_name=>"ReserveRuler"
  has_many :top_rulers

  apply_simple_captcha

  # more options
  #   http://rdoc.info/github/thoughtbot/paperclip/master/Paperclip/Attachment.default_options
  has_attached_file :avatar,
    :styles => { :medium => "300x300>", :thumb => "100x100>" , :icon=>"16x16#" },
    :default_url => '/images/:attachment/missing_:style.jpg'


  BLOCKED = 0 # 受限
  USER = 2 # 会员
  EDITOR = 4 # 员工
  ROOT = 6 # 管理员
  RULER = 8 # 量体师

  #virtual
  attr_accessor :password
  attr_accessor :new_password

  validates_attachment_content_type :avatar,
    :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'],
    :message => "图片格式错误"

  validates_attachment_size :avatar,
    :less_than => 5.megabyte,
    :message => "图片最大不能超过5M"

  validates_confirmation_of :new_password, :message => '两次新密码必须一致'
  validates_presence_of :email, :message => '邮箱为必填字段'
  validates_length_of :email, :within => 3..100,
    :message => '邮箱地址长度须合适'
  validates_format_of :email,
    :with => /\A[A-Z0-9\._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i,
    :message => 'Email格式似乎有错误'
  validates_uniqueness_of :email, :case_sensitive => false, :message => '邮箱已被占用'
  validates_presence_of :password, :if => :password_required?,
    :message => '密码不能为空'
  validates_presence_of :password_confirmation, :if => :password_required?,
    :message => '确认密码不能为空'
  validates_length_of :password, :within => 3..40,
    :if => :password_required?, :message => '密码长度须合适'
  validates_confirmation_of :password,
    :if => :password_required?, :message => '两个密码不匹配'
  validates_inclusion_of :discount, :in => 0..1, :message => '折扣须在0-1之间'

  before_save :encrypt_password

  attr_accessible :email, :password, :password_confirmation, :name, :address, :website, :zipcode, :institution, :phone , :avatar, :discount, :credit, :role, :is_company
  attr_accessible :captcha,:captcha_key

  def name
    self.try(:profile).try(:name) || email.sub(/^\w*/, email[0].chr + '***')
  end

  # Authentication with email and password. Returns the user or nil.
  def self.authenticate(email, password)
    u = find_by_email(email)
    (u && u.authenticated?(password)) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  def admin?
    role == ROOT
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  # before filter
  def encrypt_password
    return if password.blank?
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--") if new_record?
    self.crypted_password = encrypt(password)
  end

  def avatar_original
    self.avatar.url
  end

  def avatar_medium
    self.avatar.url(:medium)
  end

  def avatar_thumb
    self.avatar.url(:thumb)
  end

  def avatar_icon
    self.avatar.url(:icon)
  end

  def human_role
    return  case self.role.to_s
    when /#{BLOCKED}/ then "受限"
    when /#{USER}/ then "会员"
    when /#{EDITOR}/ then "员工"
    when /#{ROOT}/ then "管理员"
    when /#{RULER}/ then "量体师"
    end
  end

  def human_places
    self.places.map(&:area).join(",")
  end

  ##
  # http://thoughtrails.com/episodes/21-how-to-use-current-user-in-models
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def username
    profile.name
  end

  protected
  def password_required?
    crypted_password.blank? || !password.blank?
  end

end
