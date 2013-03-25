#coding:utf-8
class Kadmin::ProductsController < KadminController
  before_filter :get_categories, :only => [:new, :edit]

  def index
    statement = {:page => params[:page],
      :per_page => 30, :order => 'popularity DESC'}
    if params[:subcategory]
      statement[:conditions] = ["subcategory_id = ?", params[:subcategory]]
    end
    @products = Product.paginate(statement)
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @product }
    end
  end

  def new
    @product = Product.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:notice] = '产品已添加。请继续上传图片'
        format.html { redirect_to(kadmin_product_photos_url(@product)) }
      else
        get_categories
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = '修改成功.'
        format.html { redirect_to(kadmin_products_url) }
      else
        get_categories
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = '产品已经被删除'

    respond_to do |format|
      format.html { redirect_to(kadmin_products_url) }
      format.xml  { head :ok }
    end
  end

  def select_with_ajax
    @subcategories = Subcategory.find(:all, :conditions => ["category_id = ?", params[:category]]).collect {|s| [s.name, s.id]}
    render :layout => false
  end

protected
  def get_categories
    @categories = Category.all.collect {|c| [c.name, c.id]}
    @subcategories = Subcategory.all.collect {|s| [s.name, s.id]}
  end
end
