#coding:utf-8
class CustomersController < ApplicationController
  layout 'customer'

  def index
    @customers = if params[:height] and params[:weight]
      @height = params[:height]
      @weight = params[:weight]
      Customer.where(:height=>params[:height],:weight=>params[:weight])
    else
      Customer.where(:height=>170,:weight=>60)
    end
    if @customers.empty?
      @customers = Customer.where(:height=>170,:weight=>60)
      @height = 170
      @weight = 60
    end
    @item = if params[:id]
      Customer.find_by_id params[:id]
    else
      @customers.first
    end
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
