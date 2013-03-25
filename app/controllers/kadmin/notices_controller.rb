#coding:utf-8
class Kadmin::NoticesController < KadminController
  def index
    @notices = Notice.paginate :page => params[:page], 
      :per_page => 20,
      :order => 'popularity DESC, updated_at DESC'

    respond_to do |format|
      format.html
      format.xml  { render :xml => @notices }
    end
  end

  def new
    @notice = Notice.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @notice }
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def create
    @notice = Notice.new(params[:notice])

    respond_to do |format|
      if @notice.save
        flash[:notice] = '新闻添加成功.'
        format.html { redirect_to(kadmin_notices_url) }
        format.xml  { render :xml => @notice, :status => :created, :location => @notice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @notice = Notice.find(params[:id])

    respond_to do |format|
      if @notice.update_attributes(params[:notice])
        flash[:notice] = '修改成功.'
        format.html { redirect_to(kadmin_notices_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_notices_url) }
      format.xml  { head :ok }
    end
  end
end
