#coding:utf-8
class LinksController < ApplicationController
  before_filter :login_required

  def new
    @link = Link.new

    @title = '提交友情链接-'
    respond_to do |format|
      format.html
    end
  end

  def create
    if params[:link][:upload_photo]
      params[:link][:logo] = Photo.save_photo(params[:link][:upload_photo])
      params[:link].delete(:upload_photo)
    end

    @link = Link.new(params[:link])
    @link.popularity = 0
    @link.approved = false
    @link.user_id = current_user.id

    respond_to do |format|
      if @link.save
        flash[:notice] = '您的友情链接申请已经提交，我们会及时处理'
        format.html { redirect_to('/') }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
