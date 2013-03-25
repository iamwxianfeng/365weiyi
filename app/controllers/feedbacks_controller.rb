#coding:utf-8
class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(params[:feedback])

    respond_to do |format|
      if @feedback.save
        flash[:notice] = '留言已发布，请多向您的朋友宣传本站,谢谢!'
        format.html { redirect_to(:controller => 'events', :action => 'new') }
      else
        @user = User.new
        @feedbacks = Feedback.find(:all, :limit => 10, :order => 'created_at DESC')
        format.html { render :action => '../events/new'}
      end
    end
  end

end
