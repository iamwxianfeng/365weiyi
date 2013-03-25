#coding:utf-8
class NoticesController < ApplicationController
  #layout 'application'

  def index
    redirect_to root_path
  end
  
  def show
    @notice = Notice.find(params[:id])
    @notice.hit += 1
    @notice.save

    @title = "最新公告: #{@notice.name}-"
    respond_to do |format|
      format.html
    end
  end

end
