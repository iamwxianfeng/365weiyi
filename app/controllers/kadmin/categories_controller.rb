#coding:utf-8
class Kadmin::CategoriesController < KadminController
  def index
    @categories = Category.find(:all, :order => 'popularity DESC')

    @title = '大分类管理-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @categories }
    end
  end

  def show
    @category = Category.find(params[:id])

    @title = '分类:' + @category.name + '-'
    respond_to do |format|
      format.html
      format.xml  { render :xml => @category }
    end
  end

  def new
    @category = Category.new

    @title = '新分类-'
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
    @title = '修改分类-'
  end

  def create
    if params[:category][:logo].empty? and params[:category][:image]
      params[:category][:logo] = Photo.save_photo(params[:category][:image])
      params[:category][:image] = nil
    end
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = '分类成功添加.'
        format.html { redirect_to(kadmin_categories_url) }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = '分类已修改成功.'
        format.html { redirect_to(kadmin_categories_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_categories_url) }
      format.xml  { head :ok }
    end
  end
end
