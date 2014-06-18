#coding:utf-8
class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create,:ba,:create_ruler]
  before_filter :load_vars , :only=>[:show,:edit,:change_password]
  before_filter :set_current_user

  def new
    @user = User.new
  end

  def create
    cookies.delete :auth_token
    @user = User.new(params[:user])
    @user.role = User::USER
    @user.credit = 0
    @user.discount = 1
    if @user.save_with_captcha and Profile.create(:user_id => @user.id)
      unless (self.current_user && self.current_user.role == User::ROOT)
        self.current_user = @user
      end
      flash[:notice] = "欢迎加入维衣,体验衬衫、西服定制慢生活:-)"
      # redirect_back_or_default('/') and return
      redirect_back_or_default('http://www.365weiyi.com') and return
    else
      @user.password = nil
      @user.password_confirmation = nil
      render :new
    end
  end

  def show
    @orders = @user.orders.find(:all, :limit => 15)
    @measure_pages = MeasurePage.find(:all, :order => 'popularity DESC, created_at DESC', :limit => 100)
    @my_reserves = ReserveRuler.where(:user_id=>@user.id)
  end

  def edit
    @title = '用户资料修改-'
    if @user.is_company == true
      render :action => 'edit'
    else
      render :action => 'edit_private'
    end
  end

  def update
    @user = current_user
    @profile = (@user.profile || Profile.create(:user_id => @user.id))

    if @profile.update_attributes(params[:profile])
      flash[:notice] = '您的资料修改成功'
      redirect_to(@user)
    else
      if params[:user][:is_company] == true
        render :action => 'edit'
      else
        render :action => 'edit_private'
      end
    end
  end

  def change_password
    if User.authenticate(current_user.email, params[:old_password])
      if ((! params[:password_confirmation].blank?) &&
            (params[:password] == params[:password_confirmation]))
        current_user.password_confirmation = params[:password_confirmation]
        current_user.password = params[:password]
        if current_user.save!
          reset_session
          flash[:error] = '密码修改成功.请重新登录'
          redirect_to login_path
        else
          flash[:error] = '修改密码出错'
          render :edit
        end
      else
        flash[:error] = '两次密码不致'
        render :edit
      end
    else
      flash[:error] = '旧密码不匹配'
      render :edit
    end
  end

  def ba
    @user = User.find(params[:id])
    @profile = @user.profile
    @reserve_ruler = ReserveRuler.new
  end

  def create_ruler
    @reserve_ruler = ReserveRuler.new(params[:reserve_ruler])
    @reserve_ruler.items = params[:items]
    @reserve_ruler.reserve_id = current_user.try(:id)
    if @reserve_ruler.save
      flash[:notice] = "预约成功"
      redirect_to root_path
    else
      @reserve_ruler.reserve_at = @reserve_ruler.reserve_at.to_s(:ymd) unless @reserve_ruler.reserve_at.nil?
      @user = User.find(params[:id])
      @profile = @user.profile
      render :ba
    end
  end

  protected

  def load_vars
    @user = current_user
    @profile = @user.profile
  end


end
