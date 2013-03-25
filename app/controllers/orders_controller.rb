#coding:utf-8
class OrdersController < ApplicationController
  before_filter :login_required
  before_filter :get_payment, :only => [:new, :edit, :create]

  def index
    @orders = current_user.orders.paginate :page => params[:page],
      :per_page => 20

    @title = '我的订单-'
    respond_to do |format|
      format.html
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    @items = @order.items.all

    @title = '查看订单-'
    respond_to do |format|
      format.html
    end
  end

  def new
    @cart = get_cart
    if @cart.items.empty?
      go_home('您的购物车为空，无法结算') and return
    else

      if (profile = current_user.profile)
        @order = current_user.orders.build(:name => profile.name, 
          :address => profile.address, :zipcode => profile.zipcode,
          :phone => profile.phone)
      else
        @order = current_user.orders.build
      end
      @items = @cart.items
    end

    @metas = "订单信息"
    @title = @metas + "-"
    respond_to do |format|
      format.html
    end
  end

  def edit
    @order = current_user.orders.find(params[:id])
    if @order.progress != Order::PENDING
      flash[:notice] = '当前订单不可修改'
      redirect_to @order and return
    end
    @items = @order.items.find(:all)
  end

  def create
    @cart = get_cart

    @order = current_user.orders.build(params[:order])
    @order.import_from_cart(@cart)
    @order.user = current_user
    @order.discount = current_user.discount || 1
    @order.progress = Order::PENDING

    if @order.save
      session[:cart] = nil
      flash[:notice] = "订单已经提交，我们会及时处理"
      redirect_to current_user
    else
      render :action => "new"
    end
  end

  def update
    @order = current_user.orders.find(params[:id])
    if @order.progress != Order::PENDING
      flash[:notice] = '当前订单不可修改'
      redirect_to @order and return
    end

    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = '订单更新成功.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = current_user.orders.find(params[:id])
    if @order.progress != Order::PENDING
      flash[:notice] = '对不起，不能删除该订单'
      redirect_to orders_url and return
    end
    @order.destroy
    flash[:notice] = '该订单已删除'

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

private
  def get_payment
    @payment = [[Order::CASH], [Order::ONLINE], [Order::REMITTANCE],
      [Order::CARD], [Order::CHECK]]
    @shipping = [['自取'], ['送货上门']]
  end
end
