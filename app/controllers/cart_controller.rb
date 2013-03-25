#coding:utf-8
class CartController < ApplicationController
  before_filter :get_cart

  def index
    redirect_to :action => :edit
  end

  def new
    product = Product.find_by_id(params[:id])
    if product.blank?
      flash[:notice] = '请选择完商品再放入购物车'
      redirect_to root_path and return
    end

    @current_item = @cart.add_product(product,
                      params[:my_measure], params[:quantity])
    session[:continue_shopping_url] = request.env["HTTP_REFERER"]

    respond_to do |format|
      format.js if request.xhr?
      format.html {redirect_to :action => :edit and return}
    end
  end

  def edit
    @items = @cart.items
    @continue_shopping_url = session.delete(:continue_shopping_url) || categories_url
    @title = '购物车-'
  end

  def update
    item = @cart.items.find {|i| i.product.id == params[:id].to_i}
    item.quantity = params[:quantity].to_i
    redirect_to :action => :edit
  end

  def delete
    product_id = params[:id].to_i
    @cart.delete(product_id)
    redirect_to :action => :edit
  end

  def destroy
    session[:cart] = nil
    redirect_to root_path and return
  end

end
