#coding:utf-8
class ItemsController < ApplicationController
  before_filter :login_required
  before_filter :get_order
  before_filter :order_editable?, :except => :show
  def show
    @item = @order.items.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @item }
    end
  end

  def new
    @item = @order.items.build

    respond_to do |format|
      format.html
      format.xml  { render :xml => @item }
    end
  end

  def edit
    @item = @order.items.find(params[:id])
  end

  def create
    @item = @order.items.build(params[:item])

    respond_to do |format|
      if @item.save
        flash[:notice] = '商品项添加完成.'
        # format.html { redirect_to(@order) }
        format.html { redirect_to("http://www.365weiyi.com/orders/#{@order.id}") }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @item = @order.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = '订单商品项已更新'
        # format.html { redirect_to(@order) }
        format.html { redirect_to("http://www.365weiyi.com/orders/#{@order.id}") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = @order.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      # format.html { redirect_to(@order) }
      format.html { redirect_to("http://www.365weiyi.com/orders/#{@order.id}") }
      format.xml  { head :ok }
    end
  end

private
  def get_order
    @order = Order.find(params[:order_id])
  end

  def order_editable?
    if @order.progress != Order::PENDING
      flash[:notice] = '工作人员已经在处理您的订单。当前不可修改'
      # redirect_to @order and return
      format.html { redirect_to("http://www.365weiyi.com/orders/#{@order.id}") } and return
    end
  end
end
