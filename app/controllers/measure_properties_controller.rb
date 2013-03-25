#coding:utf-8
class MeasurePropertiesController < ApplicationController
  # GET /measure_properties
  # GET /measure_properties.xml
  def index
    @measure_properties = MeasureProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @measure_properties }
    end
  end

  # GET /measure_properties/1
  # GET /measure_properties/1.xml
  def show
    @measure_property = MeasureProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measure_property }
    end
  end

  # GET /measure_properties/new
  # GET /measure_properties/new.xml
  def new
    @measure_property = MeasureProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @measure_property }
    end
  end

  # GET /measure_properties/1/edit
  def edit
    @measure_property = MeasureProperty.find(params[:id])
  end

  # POST /measure_properties
  # POST /measure_properties.xml
  def create
    @measure_property = MeasureProperty.new(params[:measure_property])

    respond_to do |format|
      if @measure_property.save
        flash[:notice] = 'MeasureProperty was successfully created.'
        format.html { redirect_to(@measure_property) }
        format.xml  { render :xml => @measure_property, :status => :created, :location => @measure_property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measure_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /measure_properties/1
  # PUT /measure_properties/1.xml
  def update
    @measure_property = MeasureProperty.find(params[:id])

    respond_to do |format|
      if @measure_property.update_attributes(params[:measure_property])
        flash[:notice] = 'MeasureProperty was successfully updated.'
        format.html { redirect_to(@measure_property) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measure_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_properties/1
  # DELETE /measure_properties/1.xml
  def destroy
    @measure_property = MeasureProperty.find(params[:id])
    @measure_property.destroy

    respond_to do |format|
      format.html { redirect_to(measure_properties_url) }
      format.xml  { head :ok }
    end
  end
end
