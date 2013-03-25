#coding:utf-8
class SubcategoriesController < ApplicationController
  layout 'products'
  before_filter :get_category

  def index
    redirect_to root_path
  end

  def show
    @subcategories = @category.subcategories.find(:all, :order => 'popularity DESC, created_at DESC')
    @subcategory = @subcategories.find {|sub| sub.url == params[:subcategory].strip}
    if @subcategory.nil?
      go_home('您要查看的商品分类不存在') and return
    else
      cond = ""
      if params[:price] and params[:price] != "全部"
        cond << "our_price = '#{params[:price]}' "
      end
      if params[:color] and params[:color] != "全部"
        cond<< "AND color LIKE '%#{params[:color]}%' "
      end
      if params[:mianliao] and params[:mianliao] != "全部"
        cond << "AND component LIKE '%#{params[:mianliao]}%'"
      end
      cond.sub!(/^AND/,"");
      order = if params[:sort] == "价格"
        "our_price DESC"
      elsif params[:sort] == "最新"
        "created_at DESC"
      else
        "our_price ASC, popularity DESC"
      end
      @products = @subcategory.products.paginate  :conditions=>cond ,:page => params[:page], :per_page => 18, :order => order
    end

    @metas = "#{@category.name}: #{@subcategory.name}"
    @title = @metas + "-"
    @list_banner = if params[:category] == 'suit'
      Banner.where(:popularity=>Banner::LIST_BANNER_SUIT).first
    elsif params[:category] == 'shirt'
      Banner.where(:popularity=>Banner::LIST_BANNER_SHIRT).first
    elsif params[:category] == 'team'
      Banner.where(:popularity=>Banner::LIST_BANNER_TEAM).first
    end
  end

  protected
  def get_category
    @category = Category.find_by_url(params[:category].strip)
  end

end
