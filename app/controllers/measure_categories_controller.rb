#coding:utf-8
class MeasureCategoriesController < ApplicationController
  # GET /measure_categories
  # GET /measure_categories.xml
  def index
    @measure_categories = MeasureCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @measure_categories }
    end
  end

  # GET /measure_categories/1
  # GET /measure_categories/1.xml
  def show
    @measure_category = MeasureCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measure_category }
    end
  end

  # GET /measure_categories/new
  # GET /measure_categories/new.xml
  def new
    @measure_category = MeasureCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @measure_category }
    end
  end

  # GET /measure_categories/1/edit
  def edit
    @measure_category = MeasureCategory.find(params[:id])
  end

  # POST /measure_categories
  # POST /measure_categories.xml
  def create
    @measure_category = MeasureCategory.new(params[:measure_category])

    respond_to do |format|
      if @measure_category.save
        flash[:notice] = 'MeasureCategory was successfully created.'
        format.html { redirect_to(@measure_category) }
        format.xml  { render :xml => @measure_category, :status => :created, :location => @measure_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measure_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /measure_categories/1
  # PUT /measure_categories/1.xml
  def update
    @measure_category = MeasureCategory.find(params[:id])

    respond_to do |format|
      if @measure_category.update_attributes(params[:measure_category])
        flash[:notice] = 'MeasureCategory was successfully updated.'
        format.html { redirect_to(@measure_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measure_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_categories/1
  # DELETE /measure_categories/1.xml
  def destroy
    @measure_category = MeasureCategory.find(params[:id])
    @measure_category.destroy

    respond_to do |format|
      format.html { redirect_to(measure_categories_url) }
      format.xml  { head :ok }
    end
  end
end
