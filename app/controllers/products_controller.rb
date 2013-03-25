#coding:utf-8
class ProductsController < ApplicationController
  def index
    go_home and return
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.subcategory.category
    @measures = @product.measure.split(':')
    # @photos = @product.photos.find(:all, :order => 'popularity DESC',:conditions => ['popularity<?', Photo::MAIN])
    @photos = @product.photos.find(:all, :order => 'popularity DESC',:conditions => ['popularity <= ?', Photo::MAIN])
    @comments = @product.comments.find(:all, :conditions => ['approved = ?', true], :order => 'popularity DESC, created_at DESC').paginate :page => params[:page], :per_page => 20
    @comment = @product.comments.build
    render :layout=>"products_show"
  end

  def reserve
    @product = Product.find(params[:id])
    @reserve_ruler = ReserveRuler.new
    @reserve_shop = ReserveRuler.new
    render :partial=>"reserve"
  end

end
