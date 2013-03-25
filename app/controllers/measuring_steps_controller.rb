#coding:utf-8
class MeasuringStepsController < ApplicationController
  # GET /measuring_steps
  # GET /measuring_steps.xml
  def index
    @measuring_steps = MeasuringStep.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @measuring_steps }
    end
  end

  # GET /measuring_steps/1
  # GET /measuring_steps/1.xml
  def show
    @measuring_step = MeasuringStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measuring_step }
    end
  end

  # GET /measuring_steps/new
  # GET /measuring_steps/new.xml
  def new
    @measuring_step = MeasuringStep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @measuring_step }
    end
  end

  # GET /measuring_steps/1/edit
  def edit
    @measuring_step = MeasuringStep.find(params[:id])
  end

  # POST /measuring_steps
  # POST /measuring_steps.xml
  def create
    @measuring_step = MeasuringStep.new(params[:measuring_step])

    respond_to do |format|
      if @measuring_step.save
        flash[:notice] = 'MeasuringStep was successfully created.'
        format.html { redirect_to(@measuring_step) }
        format.xml  { render :xml => @measuring_step, :status => :created, :location => @measuring_step }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measuring_step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /measuring_steps/1
  # PUT /measuring_steps/1.xml
  def update
    @measuring_step = MeasuringStep.find(params[:id])

    respond_to do |format|
      if @measuring_step.update_attributes(params[:measuring_step])
        flash[:notice] = 'MeasuringStep was successfully updated.'
        format.html { redirect_to(@measuring_step) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measuring_step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /measuring_steps/1
  # DELETE /measuring_steps/1.xml
  def destroy
    @measuring_step = MeasuringStep.find(params[:id])
    @measuring_step.destroy

    respond_to do |format|
      format.html { redirect_to(measuring_steps_url) }
      format.xml  { head :ok }
    end
  end
end
