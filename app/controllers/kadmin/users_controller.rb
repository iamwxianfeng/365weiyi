#coding:utf-8
class Kadmin::UsersController < KadminController 
  
  def index
    condition = {:page => params[:page], :per_page => 30, :order => 'is_company DESC, created_at DESC, credit DESC'}
    if params[:email]
      condition[:conditions] = ['email like ?', params[:email]]
    end
    @users = User.paginate(condition)
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @orders = @user.orders.find(:all, :limit => 15)
    @measures = @user.measures.find(:all, :limit => 15)    
  end

  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
  end

  def update
    @user = User.find(params[:id])
    @profile = @user.profile
    if @user.update_attributes(params[:user]) and @profile.update_attributes(params[:profile])
      flash[:notice] = '用户修改成功.'
      redirect_to kadmin_user_path(@user)
    else
      @user.avatar = User.find(params[:id]).avatar
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to kadmin_users_url
  end
  
end
