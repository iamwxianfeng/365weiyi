#coding:utf-8
class Kadmin::FeedbacksController < KadminController
  def index
    @feedbacks = Feedback.paginate :page => params[:page],
      :per_page => 40, :order => 'updated_at DESC'

    @title = '留言管理-'
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @feedbacks }
    end
  end

  def show
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @feedback }
    end
  end


  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        flash[:notice] = 'Feedback was successfully updated.'
        format.html { redirect_to(@feedback) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feedback.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_feedbacks_url) }
      format.xml  { head :ok }
    end
  end
end
