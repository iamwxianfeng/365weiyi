#coding:utf-8
class Product < ActiveRecord::Base
  belongs_to :subcategory
  has_many :photos
  has_many :items
  has_many :comments

  validates_presence_of :name, :message => '产品名不能为空'
  validates_presence_of :subcategory_id, :message => '请为产品指定分类'
  validates_presence_of :serial_number, :message => '编号不能为空'
  validates_numericality_of :market_price, :message => '原价必须为数字'
  validates_numericality_of :our_price, :message => '售价必须为数字'
  validate :price_valid

  attr_writer :category_id

  def category_id
    return self.subcategory.category_id if self.subcategory
  end

protected
  def price_valid
    errors.add(:our_price, '售价必须大于0.1元') if our_price.nil? || our_price < 0.1
  end
end
