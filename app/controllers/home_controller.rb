#coding:utf-8
class HomeController < ApplicationController

  layout false

  def index
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
    @reserve_ruler = ReserveRuler.new
    @reserve_shop = ReserveRuler.new
  end

end