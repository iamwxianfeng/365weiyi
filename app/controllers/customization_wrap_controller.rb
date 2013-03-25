#coding:utf-8
class CustomizationWrapController < ApplicationController
  def new
    unless (params[:product_id] and params[:customization_category] and params[:customization])
      flash[:notice] = "请认真选择定制数据"
      redirect_to root_url and return
    end

    product = (Product.find(params[:product_id]) || Product.find(:first))
    @customization_wrap = (session[:customization] ||= CustomizationWrap.new(product))
    @customization_wrap.add_customization(params[:customization_category], params[:customization])

    redirect_to :back
  end

  def create
    unless (session[:customization])
      flash[:notice] = "没有定制信息，请直接结算"
      redirect_to root_path
    else
      customization = ""
      session[:customization].customizations.each do |cus|
        customization += (cus.values.join(":") + ";")
      end

      get_cart
      @cart.add_product(session[:customization].product, customization, 1)
      session[:customization] = nil
      redirect_to "/" and return
    end
  end
end
