#coding:utf-8
class Kadmin::BannersController < KadminController
  def index
    @banners = Banner.paginate :page => params[:page],
      :per_page => 30, :order => 'popularity DESC, created_at DESC'

    respond_to do |format|
      format.html
    end
  end

  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @banner = Banner.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def create
    if params[:photo]
      params[:banner][:photo_url] = Photo.save_photo(params[:photo])
    end
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        flash[:notice] = 'Banner已经保存.'
        format.html { redirect_to([:kadmin, @banner]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    if params[:photo]
      params[:banner][:photo_url] = Photo.save_photo(params[:photo])
    end
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        flash[:notice] = 'Banner已更新.'
        format.html { redirect_to([:kadmin, @banner]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @banner = Banner.find(params[:id])
    Photo.delete(@banner.photo_url)
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_banners_url) }
    end
  end
end
