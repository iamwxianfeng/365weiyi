#coding:utf-8
class Kadmin::MeasuresController < KadminController
  before_filter :get_user
  def index
    @measures = @user.measures.paginate :page => params[:page],
      :per_page => 20

    @title = '用户身材-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @measures }
    end
  end

  def show
    redirect_to :action => 'edit', :id => params[:id] and return

    @title = '查看身材数据-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @measure }
    end
  end

  def new
    @measure = @user.measures.build

    @title = '新身材数据-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @measure }
    end
  end

  def edit
    @measure = @user.measures.find(params[:id])
  end

  def create
    @measure = @user.measures.build(params[:measure])
    @measure.who_updated = current_user.id

    respond_to do |format|
      if @measure.save
        flash[:notice] = '身材数据添加成功.'
        format.html { redirect_to([:kadmin, @user]) }
        format.xml  { render :xml => @measure, :status => :created, :location => @measure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measure.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @measure = @user.measures.find(params[:id])

    respond_to do |format|
      if @measure.update_attributes(params[:measure])
        flash[:notice] = '身材数据更新成功.'
        format.html { redirect_to([:kadmin, @user]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measure.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @measure = @user.measures.find(params[:id])
    @measure.destroy

    respond_to do |format|
      format.html { redirect_to([:kadmin, @user]) }
      format.xml  { head :ok }
    end
  end

private
  def get_user
    @user = User.find(params[:user_id])
  end
end
