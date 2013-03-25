#coding:utf-8
class Kadmin::InquiriesController < KadminController
  def index
    @inquiries = Inquiry.paginate :page => params[:page], 
      :per_page => 20,
      :order => 'popularity DESC, created_at DESC'

    respond_to do |format|
      format.html
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @notice = Notice.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @notice }
    end
  end

  def edit
    @inquiry = Inquiry.find(params[:id])

    respond_to do |format|
      format.html
    end
  end


  def create
    @notice = Notice.new(params[:notice])

    respond_to do |format|
      if @notice.save
        flash[:notice] = '新闻添加成功.'
        format.html { redirect_to(kadmin_notices_url) }
        format.xml  { render :xml => @notice, :status => :created, :location => @notice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notice.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @inquiry = Inquiry.find(params[:id])

    respond_to do |format|
      @inquiry.reply = params[:inquiry][:reply]
      @inquiry.popularity = params[:inquiry][:popularity]
      if @inquiry.update_attributes(params[:inquiry])
        flash[:notice] = '回复成功.'
        format.html { redirect_to(kadmin_inquiries_url) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_inquiries_url) }
    end
  end
end
