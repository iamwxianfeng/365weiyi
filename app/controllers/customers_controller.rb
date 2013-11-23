#coding:utf-8
class CustomersController < ApplicationController
  layout 'customer'

  def index
    sql = ""
    if params[:height]
      sql << " height = '#{params[:height]}' "
    end
    if params[:weight]
      sql << "AND weight = '#{params[:weight]}' "
    end
    if params[:style]
      sql << "AND style IN (#{params[:style].join(',')}) "
    end
    if params[:other_style]
      sql << "AND other_style IN (#{params[:other_style].join(',')}) "
    end
    if request.xhr?
      sql = sql.sub(/^AND/, '')
      @customers = Customer.where(sql)
    else
      @customers = if params[:height] and params[:weight]
        Customer.where(:height=>params[:height],:weight=>params[:weight])
      else
        Customer.where(:height=>170,:weight=>60)
      end
    end
    if @customers.present?
      @item = if params[:id]
        Customer.find_by_id params[:id]
      else
        @customers.first
      end
      @shirt_product1 = Product.find_by_id @item.shirt_product1
      @shirt_product2 = Product.find_by_id @item.shirt_product2
      @shirt_product3 = Product.find_by_id @item.shirt_product3

      @suit_product1 = Product.find_by_id @item.suit_product1
      @suit_product2 = Product.find_by_id @item.suit_product2
      @suit_product3 = Product.find_by_id @item.suit_product3

      @other_product1 = Product.find_by_id @item.other_product1
      @other_product2 = Product.find_by_id @item.other_product2
      @other_product3 = Product.find_by_id @item.other_product3
    end
    if request.xhr?
      render :partial => "content"
    end
  end

  def query
  end

end
