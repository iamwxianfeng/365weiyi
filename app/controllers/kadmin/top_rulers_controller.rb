#coding:utf-8
class Kadmin::TopRulersController < KadminController
  def index
    @top_ruler = TopRuler.new
    @top_rulers = TopRuler.where("").order("created_at DESC")
  end
  
  def create
    @top_ruler = TopRuler.new({:user_id=>params[:user_id]})
    if @top_ruler.save
      redirect_to :action=>:index , :notice=>"推荐成功"
    else      
      @top_rulers = TopRuler.where("").order("created_at DESC")
      render :index
    end
  end
  
  def destroy
    @top_ruler = TopRuler.find(params[:id])
    if @top_ruler.destroy
      flash[:notice] = "删除成功"
      redirect_to :action=>:index
    else
      redirect_to :back
    end
  end

end
