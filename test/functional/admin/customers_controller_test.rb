require 'test_helper'

class Admin::CustomersControllerTest < ActionController::TestCase
  setup do
    @admin_customer = admin_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_customer" do
    assert_difference('Admin::Customer.count') do
      post :create, :admin_customer => @admin_customer.attributes
    end

    assert_redirected_to admin_customer_path(assigns(:admin_customer))
  end

  test "should show admin_customer" do
    get :show, :id => @admin_customer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @admin_customer.to_param
    assert_response :success
  end

  test "should update admin_customer" do
    put :update, :id => @admin_customer.to_param, :admin_customer => @admin_customer.attributes
    assert_redirected_to admin_customer_path(assigns(:admin_customer))
  end

  test "should destroy admin_customer" do
    assert_difference('Admin::Customer.count', -1) do
      delete :destroy, :id => @admin_customer.to_param
    end

    assert_redirected_to admin_customers_path
  end
end
