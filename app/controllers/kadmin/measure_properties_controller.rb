#coding:utf-8
class Kadmin::MeasurePropertiesController < KadminController
  before_filter :get_measure_pages, :only => [:new, :edit]

  def index
    @measure_properties = MeasureProperty.paginate(:page => params[:page],
      :per_page => 30, :order => 'popularity DESC, created_at DESC')

    @title = '量体之旅-'
    respond_to do |format|
      format.html
    end
  end

  def show
    @measure_property = MeasureProperty.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @measure_property = MeasureProperty.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @measure_property = MeasureProperty.find(params[:id])
  end

  def create
    @measure_property = MeasureProperty.new(params[:measure_property])

    respond_to do |format|
      if @measure_property.save
        flash[:notice] = '量体之旅成功添加.'
        format.html { redirect_to([:kadmin, @measure_property]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @measure_property = MeasureProperty.find(params[:id])

    respond_to do |format|
      if @measure_property.update_attributes(params[:measure_property])
        flash[:notice] = '量体之旅已经成功修改.'
        format.html { redirect_to([:kadmin, @measure_property]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @measure_property = MeasureProperty.find(params[:id])
    @measure_property.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_measure_properties_url) }
      format.xml  { head :ok }
    end
  end

private
  def get_measure_pages
    @measure_pages = MeasurePage.all.collect {|m| [m.name, m.id]}
  end
end
