#coding:utf-8
class Order < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  belongs_to :user
  belongs_to :operator, :class_name => :User, :foreign_key => :operator_id
  attr_accessible :name, :address, :zipcode, :phone, :extra_information, :appointment, :payment

  PENDING = '待确认'
  WORKING = '处理中'
  FINISHED = '交易成功'
  CANCELED = '已取消'

  #payment
  CASH = '现金'
  ONLINE = '支付宝'
  REMITTANCE = '汇款'
  CARD = '刷卡'
  CHECK = '支票'

  validates_presence_of :name, :message => '收货人姓名不能为空'
  validates_presence_of :address, :message => '收货地址不能为空'
  validates_presence_of :zipcode, :message => '邮编不能为空'


  def import_from_cart(cart)
    cart.items.each do |item|
      li = Item.import_cart_item(item)
      items << li
    end
    self.total_price = cart.price
  end

end
