#coding:utf-8
class InquiriesController < ApplicationController
  layout 'products'

  def index
    @inquiry = Inquiry.new
    @inquiries = Inquiry.paginate(:page => params[:page],
      :per_page => 20, :order => 'popularity DESC, created_at DESC')
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])

    respond_to do |format|
      @inquiry.user_id = current_user.id
      @inquiry.approved = false

      if @inquiry.save
        flash[:notice] = '问题已提交，我们会及时回复您'
        format.html { redirect_to(inquiries_url) }
      else
        format.html { redirect_to(inquiries_url) }
      end
    end
  end

end
