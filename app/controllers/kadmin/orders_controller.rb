#coding:utf-8
class Kadmin::OrdersController < KadminController
  before_filter :get_progress, :only => [:index, :edit]

  def index
    if params[:c]
      condition = ['progress=?', params[:c]]
    elsif params[:user_id]
      condition = ['user_id=?', params[:user_id]]
    else
      condition = ['progress=?', Order::PENDING]
    end
    @order_category = params[:c]
    @orders = Order.paginate :page => params[:page], :conditions => condition,:per_page => 20, :order => 'updated_at DESC'
  end

  def show
    @order = Order.find(params[:id])
    @items = @order.items.all
  end

  def edit
    @order = Order.find(params[:id])
    @items = @order.items.find(:all)
  end

  def update
    @order = Order.find(params[:id])
    #progress is NOT attr_accessible
    @order.progress = params[:order][:progress]

    respond_to do |format|
      if @order.update_attributes(params[:order])
        flash[:notice] = '订单更新成功.'
        format.html { redirect_to(kadmin_orders_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = '该订单已删除'

    respond_to do |format|
      format.html { redirect_to(kadmin_orders_url) }
      format.xml  { head :ok }
    end
  end

  private
  def get_progress
    #@progress = [[Order::PENDING, Order::PENDING], [Order::WORKING, Order::WORKING], [Order::FINISHED, Order::FINISHED], [Order::CANCELED, Order::CANCELED]]
    @progress = [Order::PENDING, Order::WORKING,
      Order::FINISHED, Order::CANCELED]
  end
end
