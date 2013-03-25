#coding:utf-8
class Kadmin::BlogCommentsController < ApplicationController
  layout "kadmin"
  
  def index
    @blog_comments = BlogComment.all
  end

  def show
    @blog_comment = BlogComment.find(params[:id])
    @blog_post = @blog_comment.blog_post
    @user = @blog_comment.user
  end

  def new
    @blog_comment = BlogComment.new
  end

  def edit
    @blog_comment = BlogComment.find(params[:id])
  end

  def create
    @blog_comment = BlogComment.new(params[:blog_comment])
    if @blog_comment.save
      redirect_to([:kadmin,@blog_comment], :notice => '创建成功.')
    else
      render :action => "new" 
    end
  end
  
  def update
    @blog_comment = BlogComment.find(params[:id])

    if @blog_comment.update_attributes(params[:blog_comment])
      redirect_to([:kadmin,@blog_comment], :notice => '更新成功.')
    else
      render :action => "edit" 
    end
  end

  def destroy
    @blog_comment = BlogComment.find(params[:id])
    @blog_comment.destroy

    redirect_to(kadmin_blog_comments_url)
  end
      
end
