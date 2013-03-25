#coding:utf-8
class Kadmin::BlogPostsController < ApplicationController
  layout 'kadmin'

  def index
    @blog_posts = BlogPost.order("created_at DESC")
  end

  def new
    @blog_post = BlogPost.new
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def create
    @blog_post = BlogPost.new(params[:blog_post].merge(:user_id=>current_user.id))
    if @blog_post.save
      redirect_to kadmin_blog_posts_path, :notice => '创建成功.'
    else
      render :action => "new"
    end
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update_attributes(params[:blog_post])
      redirect_to kadmin_blog_posts_path, :notice => '更新成功.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to(kadmin_blog_posts_url)
  end
end
