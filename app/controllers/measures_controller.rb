#coding:utf-8
class MeasuresController < ApplicationController
  before_filter :login_required

  def index
    @measures = current_user.measures.paginate :page => params[:page],
      :per_page => 20

    @title = '我的身材数据-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @measures }
    end
  end

  def show
    redirect_to :action => 'edit', :id => params[:id] and return

    respond_to do |format|
      format.html
      format.xml  { render :xml => @measure }
    end
  end

  def new
    @measure = current_user.measures.build

    respond_to do |format|
      format.html
      format.xml  { render :xml => @measure }
    end
  end

  def edit
    @measure = current_user.measures.find(params[:id])
  end

  def create
    @measure = current_user.measures.build(params[:measure])
    @measure.who_updated = current_user.id

    respond_to do |format|
      if @measure.save
        flash[:notice] = '身材数据添加成功.'
        format.html { redirect_to(current_user) }
        format.xml  { render :xml => @measure, :status => :created, :location => @measure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @measure.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @measure = current_user.measures.find(params[:id])

    respond_to do |format|
      if @measure.update_attributes(params[:measure])
        flash[:notice] = '身材数据更新成功.'
        format.html { redirect_to(current_user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measure.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @measure = current_user.measures.find(params[:id])
    @measure.destroy

    respond_to do |format|
      format.html { redirect_to(current_user) }
      format.xml  { head :ok }
    end
  end
end
