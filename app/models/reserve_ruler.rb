#coding:utf-8
class ReserveRuler < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  belongs_to :shop
  belongs_to :reserve , :foreign_key => "reserve_id" , :class_name=>"User"
  belongs_to :product
  
  serialize :items , Array
  
  validates :reserve_at , :presence => { message: "时间不能为空" }
  validates :place_id , :presence=>{message: "地点不能为空" , :if => Proc.new { self.status != Status::Shop } }
  validates :office , :presence=>{ message: "详细地址不能为空" , :if => Proc.new { self.status != Status::Shop } }
  validates :items , :presence => {message: "要定不能为空" }
  validates :phone , :presence=> {message: "手机不能为空" } , :numericality => { message: "手机必须为数字" }
  validates :username , :presence => { message: "联系人不能为空" }  # :if => :not_logged_in? # 注意if条件后面跟的是方法名的symbol 不是方法名
  validates :shop_id , :presence=>{ message: "体验店不能为空"  , :if=> lambda { self.status == Status::Shop } }
  
  module Status
    NoneRuler = 0 # 没有指定量体师(首页)
    Ruler = 2 # 指定量体师(量体师页面)
    Shop = 1 # 体验店(首页)
  end
  
  def not_logged_in?
    User.current.nil?
  end
  
  def error
    errors.values.join(",")
  end
  
  def reserve_on
    reserve_at.to_s(:ymd) + " " + day_when.to_s
  end
  
  def where
    return "" if place.nil?
    place.provice + place.city + place.area + place.street + office
  end
  
  def human_status
    case status.to_s
    when /#{Status::NoneRuler}/
      "预约无量体师"
    when /#{Status::Ruler}/
      "预约有量体师"
    when /#{Status::Shop}/
      "预约体验店"
    end
  end
  
end