#coding:utf-8
class CustomersController < ApplicationController
  layout 'customer'

  def index
    @customers = Customer.where(:height=>170,:weight=>60)
    @item = @customers.first
    @shirt_product1 = Product.find @item.shirt_product1
    @shirt_product2 = Product.find @item.shirt_product2
    @shirt_product3 = Product.find @item.shirt_product3

    @suit_product1 = Product.find @item.suit_product1
    @suit_product2 = Product.find @item.suit_product2
    @suit_product3 = Product.find @item.suit_product3

    @other_product1 = Product.find @item.other_product1
    @other_product2 = Product.find @item.other_product2
    @other_product3 = Product.find @item.other_product3
  end

  def query
  end

end
