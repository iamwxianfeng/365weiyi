#coding:utf-8
class Kadmin::UploadedPhotosController < KadminController
  def index
    @uploaded_photos = Photo.paginate :page => params[:page], :per_page => 30,
      :order => 'popularity DESC'

    respond_to do |format|
      format.html
    end
  end

  def show
    @uploaded_photo = Photo.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @uploaded_photo = Photo.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @uploaded_photo = Photo.find(params[:id])
  end

  def create
    if params[:uploaded_photo][:image]
      params[:uploaded_photo][:url] = Photo.save_photo(params[:uploaded_photo][:image])
      params[:uploaded_photo][:image] = nil
    end
    @photo = Photo.new(params[:uploaded_photo])

    respond_to do |format|
      if @photo.save
        flash[:notice] = '图片已经保存.'
        format.html { redirect_to(kadmin_uploaded_photos_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @uploaded_photo = Photo.find(params[:id])

    respond_to do |format|
      if @uploaded_photo.update_attributes(params[:uploaded_photo])
        flash[:notice] = '图片已修改完成.'
        format.html { redirect_to(kadmin_uploaded_photos_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    Photo.delete(@photo.url)
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_uploaded_photos_url) }
    end
  end

end
