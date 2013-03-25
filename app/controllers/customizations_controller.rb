#coding:utf-8
class CustomizationsController < ApplicationController
  layout "products"

  def index
    if (@product_id = params[:product_id]).blank?
      flash[:notice] = '请先选定商品再定制'
      redirect_to "/" and return
    end

    params[:category] = (params[:category] or "领型")

    case params[:category]
    when "领型", "袖口"
      @customization_category = params[:category]
      condition = {:category => params[:category]}
      target_action = "index"
    else
      @customization_category = "其它"
      conditon = ["category NOT IN (?, ?)", "领型", "袖口"]
      target_action = "index_others"
    end

    @customizations = Customization.paginate(:all, :conditions => condition,
      :order => 'popularity DESC', :page => params[:page], :per_page => 30)

      respond_to do |format|
        format.html {render :action => target_action}
      end
  end

  def show
    @customization = Customization.find_by_category(params[:category])

    respond_to do |format|
      format.html
    end
  end

  def new
    @customization = Customization.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @customization }
    end
  end

  def edit
    @customization = Customization.find(params[:id])
  end

  def create
    @customization = Customization.new(params[:customization])

    respond_to do |format|
      if @customization.save
        flash[:notice] = 'Customization was successfully created.'
        format.html { redirect_to(@customization) }
        format.xml  { render :xml => @customization, :status => :created, :location => @customization }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @customization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /customizations/1
  # PUT /customizations/1.xml
  def update
    @customization = Customization.find(params[:id])

    respond_to do |format|
      if @customization.update_attributes(params[:customization])
        flash[:notice] = 'Customization was successfully updated.'
        format.html { redirect_to(@customization) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @customization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /customizations/1
  # DELETE /customizations/1.xml
  def destroy
    @customization = Customization.find(params[:id])
    @customization.destroy

    respond_to do |format|
      format.html { redirect_to(customizations_url) }
      format.xml  { head :ok }
    end
  end
end
