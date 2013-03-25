#coding:utf-8
class Kadmin::CommentsController < KadminController
  def index
    condition = {:page => params[:page], :per_page => 30, :order => 'created_at DESC, product_id DESC'}
    if params[:product_id]
      condition[:conditions] = ['product_id = ?', params[:product_id]]
    end

    @comments = Comment.paginate(condition)

    respond_to do |format|
      format.html
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @comment }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Kadmin::Comment was successfully created.'
        format.html { redirect_to(@comment) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.approved = params[:comment][:approved]
    @comment.popularity = params[:comment][:popularity]

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = '评论修改成功'
        format.html { redirect_to([:kadmin, @comment]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_comments_url) }
    end
  end

end
