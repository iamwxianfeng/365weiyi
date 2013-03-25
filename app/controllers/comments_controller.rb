#coding:utf-8
class CommentsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  before_filter :get_product
  
  def index    
    redirect_to(@product)
  end

  def create
    @comment = @product.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.approved = false
    @comment.popularity = 0
    
    if @comment.save
      flash[:notice] = '留言正等待管理员审核，感谢您对我们的支持！'
      redirect_to(@product) 
    else
      Rails.logger.debug "debug #{@comment.errors}"
      flash[:notice] = '请确认您的留言内容是否符合要求'
      redirect_to(@product)
    end
  end

  private
  def get_product
    @product = Product.find(params[:product_id])
  end
end
