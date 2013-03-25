#coding:utf-8
class Kadmin::CustomizationsController < KadminController
  before_filter :prepare_category_select, :only => [:new, :edit]

  def index
    @customizations = Customization.paginate :page => params[:page], 
      :per_page => 20,
      :order => 'popularity DESC, updated_at DESC'

    respond_to do |format|
      format.html
    end
  end

  def new
    @customization = Customization.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @customization = Customization.find(params[:id])
  end

  def create
    @customization = Customization.new(params[:customization])

    respond_to do |format|
      if @customization.save
        flash[:notice] = '新闻添加成功.'
        format.html { redirect_to(kadmin_customization_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @customization = Customization.find(params[:id])

    respond_to do |format|
      if @customization.update_attributes(params[:customization])
        flash[:notice] = '修改成功.'
        format.html { redirect_to(kadmin_customizations_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @customization = Customization.find(params[:id])
    @customization.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_customizations_url) }
    end
  end

private
  def prepare_category_select
    @customization_category = [["领型"], ["袖口"]]
  end
end
