#coding:utf-8
class Kadmin::BlogCategoriesController < ApplicationController
  layout "kadmin"
  
  def index
    @blog_categories = BlogCategory.all
  end
  
  def show
    @blog_category = BlogCategory.find(params[:id])
  end

  def new
    @blog_category = BlogCategory.new
  end

  def edit
    @blog_category = BlogCategory.find(params[:id])
  end

  def create
    @blog_category = BlogCategory.new(params[:blog_category])

    if @blog_category.save
      redirect_to([:kadmin,@blog_category], :notice => '创建成功.') 
    else
      render :action => "new" 
    end
  end
  
  def update
    @blog_category = BlogCategory.find(params[:id])

    if @blog_category.update_attributes(params[:blog_category])
      redirect_to([:kadmin,@blog_category], :notice => '更新成功.')
    else
      format.html { render :action => "edit" }
    end
  end

  def destroy
    @blog_category = BlogCategory.find(params[:id])
    @blog_category.destroy

    redirect_to(kadmin_blog_categories_url)
  end
end
