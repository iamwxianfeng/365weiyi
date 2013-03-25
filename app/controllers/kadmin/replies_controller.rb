#coding:utf-8
class Kadmin::RepliesController < KadminController
  before_filter :get_comment
  def index
    @kadmin_replies = @comment.replies
  end

  def show
    @reply = @comment.replies.find(params[:id])
  end

  def new
    @reply = @comment.replies.build
  end

  def edit
    @reply = Reply.find(params[:id])
  end

  def create
    @reply = @comment.replies.build(params[:reply])
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        flash[:notice] = '回复已经发布'
        format.html { redirect_to([:kadmin, @comment, @reply]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @reply = @comment.replies.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        flash[:notice] = '回复已经修改'
        format.html { redirect_to(@reply) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @reply = @comment.replies.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to([:kadmin, @comment]) }
    end
  end

private
  def get_comment
    @comment = Comment.find(params[:comment_id])
  end
end
