#coding:utf-8
class ProfilesController < ApplicationController
  def update
    @profile = Profile.find(params[:id])
    @user = @profile.user

    if @profile.update_attributes(params[:profile])
      flash[:notice] = '用户资料已经保存.'
      redirect_to(@user) and return
    else

      if params[:user][:is_company] == true
        render :action => 'edit', :controller => "users"
      else
        render :action => 'edit_private', :controller => "users"
      end

    end
  end

end
