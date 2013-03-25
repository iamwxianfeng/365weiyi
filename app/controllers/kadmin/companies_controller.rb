#coding:utf-8
class Kadmin::CompaniesController < KadminController
  before_filter :get_role, :only => 'edit'
  def index
    @companies = User.paginate :page => params[:page],
      :per_page => 20, :order => 'created_at DESC, credit DESC',
      :conditions => ['is_company = ?', true]

      respond_to do |format|
        format.html 
      end
  end

  def show
    @company = User.find(params[:id])
    @orders = @company.orders
    @measures = @company.measures

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @company = User.find(params[:id])
  end

  def update
    @company = User.find(params[:id])
    @company.role = params[:user][:role]

    respond_to do |format|
      if (@company.update_attributes(params[:user]))

        flash[:notice] = '用户修改成功.'
        format.html { redirect_to(kadmin_companies_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @company = User.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(kadmin_companies_url) }
      format.xml  { head :ok }
    end
  end

private
  def get_role
    @role = [['受限用户', User::BLOCKED], ['普通', User::USER], 
      ['工作人员', User::EDITOR], ['管理员', User::ROOT]]
  end
  
end
