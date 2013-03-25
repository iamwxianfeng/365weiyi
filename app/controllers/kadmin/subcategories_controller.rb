#coding:utf-8
class Kadmin::SubcategoriesController < KadminController
  before_filter :get_category
  
  # GET /subcategories
  # GET /subcategories.xml
  def index
    @subcategories = @category.subcategories.find(:all, :order => 'popularity DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subcategories }
    end
  end

  # GET /subcategories/1
  # GET /subcategories/1.xml
  def show
    @subcategory = @category.subcategories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subcategory }
    end
  end

  # GET /subcategories/new
  # GET /subcategories/new.xml
  def new
    @subcategory = @category.subcategories.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subcategory }
    end
  end

  # GET /subcategories/1/edit
  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  # POST /subcategories
  # POST /subcategories.xml
  def create
    @subcategory = @category.subcategories.build(params[:subcategory])

    respond_to do |format|
      if @subcategory.save
        flash[:notice] = '二级分类添加成功.'
        format.html { redirect_to(kadmin_category_subcategories_url(@category)) }
        format.xml  { render :xml => @subcategory, :status => :created, :location => @subcategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subcategories/1
  # PUT /subcategories/1.xml
  def update
    @subcategory = @category.subcategories.find(params[:id])

    respond_to do |format|
      if @subcategory.update_attributes(params[:subcategory])
        flash[:notice] = '二级分类修改成功.'
        format.html { redirect_to(kadmin_category_subcategories_url(@category)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.xml
  def destroy
    @subcategory = @category.subcategories.find(params[:id])
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_category_subcategories_url(@category)) }
      format.xml  { head :ok }
    end
  end

protected
  def get_category
    @category = Category.find(params[:category_id])
  end
end
