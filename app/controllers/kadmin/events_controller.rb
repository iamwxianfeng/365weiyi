#coding:utf-8
class Kadmin::EventsController < KadminController
  def index
    @events = Event.paginate :page => params[:page],
      :per_page => 40, :order => 'created_at DESC, price DESC'

    respond_to do |format|
      format.html 
    end
  end

  def show
    redirect_to :action => 'index'
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_events_url) }
    end
  end
end
