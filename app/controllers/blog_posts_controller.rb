#coding:utf-8
class BlogPostsController < ApplicationController
  layout 'blog'
  
  def index
    @blog_posts = if params[:c]
      BlogPost.paginate(:conditions=>{:category_id=>params[:c],:published=>true},:page=>params[:page],:order=>"created_at DESC")
    elsif params[:tag]
      blog_post_ids = BlogTag.where(:name=>params[:tag]).map(&:id)
      BlogPost.paginate(:conditions=>["published = ? AND id IN (?)",1,blog_post_ids],:page=>params[:page],:order=>"created_at DESC")
    else
      BlogPost.paginate(:conditions=>{:published=>true},:page=>params[:page],:order=>"created_at DESC")
    end
    if @blog_posts.present?
      blog_post = @blog_posts.sample
      @products = blog_post.products      
    end
    @blog_categories = BlogCategory.all
  end
  
  def show
    @blog_post = BlogPost.find(params[:id])
    @user = @blog_post.user
    @profile = @user.profile
    @products = @blog_post.products
    @blog_categories = BlogCategory.all
    @blog_comments = @blog_post.comments
    @blog_tags = @blog_post.blog_tags
  end

end
