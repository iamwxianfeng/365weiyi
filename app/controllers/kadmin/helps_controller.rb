#coding:utf-8
class Kadmin::HelpsController < KadminController
  def index
    @helps = Help.all

    @title = '底部信息-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @helps }
    end
  end

  def new
    @help = Help.new

    @title = '新底部信息-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @help }
    end
  end

  def edit
    @help = Help.find(params[:id])
    @title = '修改信息-'
  end

  def create
    @help = Help.new(params[:help])

    respond_to do |format|
      if @help.save
        flash[:notice] = '添加成功.'
        format.html { redirect_to(@help) }
        format.xml  { render :xml => @help, :status => :created, :location => @help }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @help.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @help = Help.find(params[:id])

    respond_to do |format|
      if @help.update_attributes(params[:help])
        flash[:notice] = '修改成功.'
        format.html { redirect_to(kadmin_helps_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @help.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @help = Help.find(params[:id])
    @help.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_helps_url) }
      format.xml  { head :ok }
    end
  end
end
