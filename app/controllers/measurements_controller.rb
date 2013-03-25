#coding:utf-8
class MeasurementsController < ApplicationController
  before_filter :get_user

  def index
    if (params[:measure_page])
      if (measure_page = MeasurePage.find(params[:measure_page]))
        property_ids = measure_page.measure_properties.collect {|m| m.id.to_i}
        condition = {:measure_property_id => property_ids}
      end
    end

    @measurements = @user.measurements.paginate :page => params[:page],
      :per_page => 30, :conditions => condition

    respond_to do |format|
      format.html
    end
  end

  def show
    @measurement = Measurement.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @measurement }
    end
  end

  def new
    @measurement = Measurement.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @measurement = @user.measurements.find(params[:id])
  end

  def create
    #raise params.inspect

    respond_to do |format|
      if (Measurement.create_from_params(params, current_user))
        flash[:notice] = '数据已经保存.'
        format.html { redirect_to(current_user) }
      else
        flash[:notice] = "保存数据时出错"
        format.html { redirect_to root_path }
      end
    end
  end

  def update
    @measurement = @user.measurements.find(params[:id])

    respond_to do |format|
      if @measurement.update_attributes(params[:measurement])
        flash[:notice] = '量体数据已保存.'
        format.html { redirect_to(@user) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @measurement = @user.measurements.find(params[:id])
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to(measurements_url) }
    end
  end

protected
  def get_user
    @user = current_user
  end
end
