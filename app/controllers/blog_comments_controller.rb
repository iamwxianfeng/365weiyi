#coding:utf-8
class BlogCommentsController < ApplicationController
  
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_comment = BlogComment.new({ blog_post_id: params[:blog_post_id],content: params[:content],user_id: current_user.id })
    if @blog_comment.save
      redirect_to blog_post_path(@blog_post,:anchor=>@blog_comment.id)
    else
      redirect_to :back
    end
  end
  
end