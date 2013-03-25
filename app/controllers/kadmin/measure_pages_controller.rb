#coding:utf-8
class Kadmin::MeasurePagesController < KadminController
  def index
    @measure_pages = MeasurePage.paginate(:page => params[:page],
      :per_page => 30, :order => 'popularity DESC, created_at DESC')

    respond_to do |format|
      format.html
    end
  end

  def show
    @measure_page = MeasurePage.find(params[:id]) || MeasurePage.find(:first)

    respond_to do |format|
      format.html
    end
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
        flash[:notice] = '量体页面已添加.'
        format.html { redirect_to(kadmin_measure_pages_url) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @measure_page = MeasurePage.find(params[:id])

    respond_to do |format|
      if @measure_page.update_attributes(params[:measure_page])
        flash[:notice] = '量体中心页面已经保存.'
        format.html { redirect_to(kadmin_measure_pages_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @measure_page = MeasurePage.find(params[:id])
    @measure_page.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_measure_pages_url) }
    end
  end
end
