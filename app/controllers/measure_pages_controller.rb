#coding:utf-8
class MeasurePagesController < ApplicationController
  layout "measure_pages"
  
  def index
    @measure_page = MeasurePage.find(:first)
    # redirect_to @measure_page
    redirect_to "http://www.365weiyi.com/measure_pages/#{@measure_page.id}"
  end

  def show
    @measure_page = (MeasurePage.find(params[:id]) || MeasurePage.find(:first))
    @other_meausre_pages = MeasurePage.find(:all, :limit => 100,
      :conditions => ["id != ?", @measure_page.id])

    @measure_properties = @measure_page.measure_properties.find(:all,
      :order => 'popularity DESC, created_at DESC', :limit => 100)
    @measurement = Measurement.new

    @metas = "量体中心：#{@measure_page.name}"
    @title = @metas + "-"    
  end

  def new
    @measure_page = MeasurePage.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @measure_page }
    end
  end

  def edit
    @measure_page = MeasurePage.find(params[:id])
  end

  def create
    @measure_page = MeasurePage.new(params[:measure_page])

    respond_to do |format|
      if @measure_page.save
        flash[:notice] = 'MeasurePage was successfully created.'
        format.html { redirect_to(@measure_page) }
        format.xml  { render :xml => @measure_page, :status => :created, :location => @measure_page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measure_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @measure_page = MeasurePage.find(params[:id])

    respond_to do |format|
      if @measure_page.update_attributes(params[:measure_page])
        flash[:notice] = 'MeasurePage was successfully updated.'
        format.html { redirect_to(@measure_page) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measure_page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @measure_page = MeasurePage.find(params[:id])
    @measure_page.destroy

    respond_to do |format|
      format.html { redirect_to(measure_pages_url) }
      format.xml  { head :ok }
    end
  end
end
