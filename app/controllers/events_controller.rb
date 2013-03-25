#coding:utf-8
class EventsController < ApplicationController
  layout 'events'

  def index
    redirect_to :action => 'new'
  end

  #show current event
  def new
    @user = User.new
    prepare_feedback

    respond_to do |format|
      format.html
    end
  end

  def create
    if current_user
      @user = current_user
    else
      cookies.delete :auth_token
      @user = User.new(params[:user])
      @user.role = User::USER
      @user.credit = 0
      @user.is_company = false
      @user.save
    end

    respond_to do |format|
      if (@user.errors.empty?)
        profile_param = {:phone => params[:phone],
            :height => params[:height], :figure => params[:figure]}
        if @user.profile
          @user.profile.update_attributes(profile_param)
        else
          Profile.create(profile_param.merge({:user_id => @user.id}))
        end

        Event.create(:price => params[:price], :user_id => @user.id)
        flash[:notice] = '谢谢参与活动,我们会及时联系您.'
        format.html { redirect_to(root_path) }
      else
        prepare_feedback
        flash[:notice] = '出错啦,请重新填写表单,谢谢'
        format.html { render :action => "new" }
      end
    end
  end

private

  def prepare_feedback
    @feedback = Feedback.new
    @feedbacks = Feedback.find(:all, :limit => 10, 
                              :order => 'created_at DESC')
  end

end
