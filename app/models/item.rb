#coding:utf-8
class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates_presence_of :product_id
  
  def self.import_cart_item(cart_item)
    li = self.new
    li.product = cart_item.product
    li.quantity = cart_item.quantity
    #单价
    li.price = cart_item.product.our_price
    li.total_price = cart_item.price
    li.measure = cart_item.measure
    li
  end
end
