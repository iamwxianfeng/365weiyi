#coding:utf-8
class Kadmin::PhotosController < KadminController
  before_filter :get_product

  def index
    @photos = @product.photos.paginate(:all, :page => params[:page], :per_page => 20, :order => 'popularity DESC')
  end

  def show
    @photo = @product.photos.find(params[:id])
  end

  def new
    @photo = @product.photos.build
  end

  def edit
    @photo = @product.photos.find(params[:id])
  end

  def create
    if params[:photo][:url].empty? and params[:photo][:image]
      params[:photo][:url] = Photo.save_photo(params[:photo][:image])
      params[:photo][:image] = nil
    end
    @photo = @product.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        flash[:notice] = '图片已经保存.'
        format.html { redirect_to([:kadmin, @product, @photo]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @photo = @product.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = '图片已修改完成.'
        format.html { redirect_to([:kadmin, @product, @photo]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = @product.photos.find(params[:id])
    Photo.delete(@photo.url)
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_product_photos_url(@product)) }
    end
  end

protected
  def get_product
    @product = Product.find(params[:product_id])
  end
end
