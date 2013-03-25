#coding:utf-8
class Kadmin::ReserveRulersController < KadminController

  def index
    @reserve_rulers = ReserveRuler.paginate :page=>params[:page] , :order=>"created_at DESC"
  end

  def destroy
    @rr = ReserveRuler.find(params[:id])
    if @rr.destroy
      flash[:notice] = "删除成功!"
      redirect_to :action=>:index
    else
      redirect_to :back
    end
  end

end
