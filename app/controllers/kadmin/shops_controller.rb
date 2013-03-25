#coding:utf-8
class Kadmin::ShopsController < KadminController
  
  def index
    @shops = Shop.paginate :page=>params[:page]
  end
  
  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(params[:shop])
    
    if @shop.save
      redirect_to([:kadmin,@shop], :notice => '创建成功.')
    else
      render :action => "new"         
    end    
  end
  
  def update
    @shop = Shop.find(params[:id])

    if @shop.update_attributes(params[:shop])
      redirect_to([:kadmin,@shop], :notice => '更新成功.')
    else
      render :action => "edit" 
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    redirect_to(kadmin_shops_url) 
  end
end
