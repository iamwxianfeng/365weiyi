#coding:utf-8
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include SimpleCaptcha::ControllerHelpers

  helper :all # include all helpers, all the time
  protect_from_forgery
  before_filter :prepare_data
  # around_filter :no_record

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def set_current_user
    User.current = current_user
  end

  protected
  def get_cart
    @cart = (session[:cart] ||= Cart.new)
  end

  def prepare_data
    @categories = Category.all(:order =>'popularity DESC, created_at ASC')
    @notices = Notice.all(:limit => 7,:order => 'popularity DESC, updated_at DESC')
    @links = Link.all(:order => 'popularity DESC, created_at DESC', :conditions => ['approved = ?', true])
  end

  def no_record
    begin
      yield
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = '请确认您的输入是否正确'
      redirect_to root_path
    end
  end

  def go_home(msg = nil)
    flash[:notice] = msg
    redirect_to root_path
  end

end
