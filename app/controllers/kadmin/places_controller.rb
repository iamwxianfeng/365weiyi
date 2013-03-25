#coding:utf-8
class Kadmin::PlacesController < KadminController
  
  def index
    @places = Place.paginate :page=>params[:page]
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end
  
  def edit
    @place = Place.find(params[:id])
  end

  def create
    @place = Place.new(params[:place])
    if @place.save
      redirect_to([:kadmin,@place], :notice => '创建成功')
    else
      render :action => "new" 
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.update_attributes(params[:place])
      redirect_to([:kadmin,@place], :notice => '更新成功.')
    else
      render :action => "edit" 
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to kadmin_places_url
  end
end
