#coding:utf-8
class HomeController < ApplicationController

  layout false

  def index
    banners = Banner.all(:order => 'popularity DESC, created_at DESC',:conditions=>"popularity < 10")
    @scrolling_banners = banners.find_all {|i| i.can_scroll == true and i.popularity < Banner::TOP_BANNER}
    @top_banners = banners.find_all {|i| i.popularity == Banner::TOP_BANNER}
    @side_banners = banners.find_all {|i| i.popularity < Banner::TOP_BANNER and i.can_scroll == false}
    @top_rulers = TopRuler.includes("user").limit(2)
    @posts = BlogPost.limit(7).order("created_at DESC")
  end

end