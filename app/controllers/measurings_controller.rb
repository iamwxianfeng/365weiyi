#coding:utf-8
class MeasuringsController < ApplicationController
  # GET /measurings
  # GET /measurings.xml
  def index
    @measurings = Measuring.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @measurings }
    end
  end

  # GET /measurings/1
  # GET /measurings/1.xml
  def show
    @measuring = Measuring.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measuring }
    end
  end

  # GET /measurings/new
  # GET /measurings/new.xml
  def new
    @measuring = Measuring.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @measuring }
    end
  end

  # GET /measurings/1/edit
  def edit
    @measuring = Measuring.find(params[:id])
  end

  # POST /measurings
  # POST /measurings.xml
  def create
    @measuring = Measuring.new(params[:measuring])

    respond_to do |format|
      if @measuring.save
        flash[:notice] = 'Measuring was successfully created.'
        format.html { redirect_to(@measuring) }
        format.xml  { render :xml => @measuring, :status => :created, :location => @measuring }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measuring.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /measurings/1
  # PUT /measurings/1.xml
  def update
    @measuring = Measuring.find(params[:id])

    respond_to do |format|
      if @measuring.update_attributes(params[:measuring])
        flash[:notice] = 'Measuring was successfully updated.'
        format.html { redirect_to(@measuring) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measuring.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /measurings/1
  # DELETE /measurings/1.xml
  def destroy
    @measuring = Measuring.find(params[:id])
    @measuring.destroy

    respond_to do |format|
      format.html { redirect_to(measurings_url) }
      format.xml  { head :ok }
    end
  end
end
