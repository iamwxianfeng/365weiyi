#coding:utf-8
class CategoriesController < ApplicationController
  before_filter :load_vars , :only=>[:index,:reserve_ruler,:reserve_shop]
  before_filter :set_current_user
  skip_before_filter :verify_authenticity_token , :only=>[:reserve_ruler,:reserve_shop]

  def index
    @reserve_ruler = ReserveRuler.new
    @reserve_shop = ReserveRuler.new
  end

  def reserve_ruler
    @reserve_ruler = ReserveRuler.new(params[:reserve_ruler])
    @reserve_ruler.items = params[:items]
    @reserve_ruler.reserve_id = current_user.try(:id)
    if @reserve_ruler.save
      if params[:reserve_ruler][:product_id]
        render :json => { status: 'ok' }
      else
        begin
          UserMailer.reserve(@reserve_ruler).deliver!
        rescue 
        end
        flash[:notice] = "预约成功"
        redirect_to root_path(:anchor=>"bd")
      end
    else
      @reserve_ruler.reserve_at = @reserve_ruler.reserve_at.to_s(:ymd) unless @reserve_ruler.reserve_at.nil?
      @errors = @reserve_ruler.error
      @reserve_shop = ReserveRuler.new
      if params[:reserve_ruler][:product_id]
        @product = Product.find(params[:reserve_ruler][:product_id])
        render :json => { status: 'fail',errors: @errors }
      else
        render "home/index", :layout => false
      end
    end
  end

  def reserve_shop
    @reserve_shop = ReserveRuler.new(params[:reserve_shop])
    @reserve_shop.items = params[:items]
    @reserve_shop.reserve_id = current_user.try(:id)
    if @reserve_shop.save
      if params[:reserve_shop][:product_id]
        render :json => { status: 'ok' }
      else
        begin
          UserMailer.reserve(@reserve_shop).deliver!
        rescue 
        end
        flash[:notice] = "预约成功"
        redirect_to root_path(:anchor=>"bd")
      end
    else
      @reserve_shop.reserve_at = @reserve_shop.reserve_at.to_s(:ymd) unless @reserve_shop.reserve_at.nil?
      @errors = @reserve_shop.error
      @reserve_ruler = ReserveRuler.new
      if params[:reserve_shop][:product_id]
        render :json => { status: 'fail',errors: @errors }
      else
        render "home/index", :layout => false
      end
    end
  end

  def show
    category = Category.find_by_url(params[:category].strip)
    if category.nil?
      go_home('您要查看的分类下暂无商品') and return
    end
    subcategory = category.subcategories.first(:order =>'popularity DESC, created_at ASC')
    if subcategory.nil?
      go_home('您要查看的分类下暂无商品') and return
    else
      redirect_to "/#{category.url}/#{subcategory.url}"
    end
  end

  protected

  def load_vars
    # banners = Banner.all(:order => 'popularity DESC, created_at DESC')
    # @scrolling_banners = banners.find_all {|i| i.can_scroll == true and i.popularity < Banner::TOP_BANNER}
    # @top_banners = banners.find_all {|i| i.popularity == Banner::TOP_BANNER}
    # @side_banners = banners.find_all {|i| i.popularity < Banner::TOP_BANNER and i.can_scroll == false}
    # @top_rulers = TopRuler.includes("user").limit(2)
    # @posts = BlogPost.limit(7).order("created_at DESC")

    banners = Banner.all(:order => 'popularity DESC, created_at DESC',:conditions=>"popularity < 10")
    @scrolling_banners = banners.find_all {|i| i.can_scroll == true and i.popularity < Banner::TOP_BANNER}
    @suit_banner = Banner.where(:popularity=>Banner::HOME_SUIT).order("created_at ASC").last
    @shirt_banner = Banner.where(:popularity=>Banner::HOME_SHIRT).order("created_at ASC").last
    @top_banners = banners.find_all {|i| i.popularity == Banner::TOP_BANNER}
    @side_banners = banners.find_all {|i| i.popularity < Banner::TOP_BANNER and i.can_scroll == false}
    @top_rulers = TopRuler.includes("user").limit(2)
    @posts = BlogPost.limit(7).order("created_at DESC")
    suit_category = Category.find_by_name("西服定制")
    @suit_products = suit_category.products.order('popularity DESC,our_price ASC').limit(5)
    shirt_category = Category.find_by_name("衬衫定制")
    @shirt_products  = shirt_category.products.order('popularity DESC,our_price ASC').limit(5)
    @brand_suits = Banner.where(:popularity=>Banner::BRAND_SUIT).order("created_at DESC").limit(4)
    @brand_shirts = Banner.where(:popularity=>Banner::BRAND_SHIRT).order("created_at DESC").limit(4)

  end

end
