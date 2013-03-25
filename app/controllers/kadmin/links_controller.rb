#coding:utf-8
class Kadmin::LinksController < KadminController
  def index
    @links = Link.all :order => 'approved ASC, popularity DESC, created_at DESC'

    respond_to do |format|
      format.html
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if params[:link][:upload_photo]
      Photo.delete(@link.logo) if @link.logo != '/images/link_default.gif'
      params[:link][:logo] = Photo.save_photo(params[:link][:upload_photo])
      params[:link].delete(:upload_photo)
    end
    @link.popularity = params[:link][:popularity]
    @link.approved = params[:link][:approved]

    respond_to do |format|
      if @link.update_attributes(params[:link])
        flash[:notice] = '您对友情链接的修改已保存'
        format.html { redirect_to(edit_kadmin_link_url(@link)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    Photo.delete(@link.logo) if @link.logo != '/images/link_default.gif'
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_links_url) }
    end
  end
end
