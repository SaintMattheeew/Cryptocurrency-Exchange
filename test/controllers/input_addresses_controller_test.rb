require 'test_helper'

class InputAddressesControllerTest < ActionController::TestCase
  setup do
    @input_address = input_addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:input_addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create input_address" do
    assert_difference('InputAddress.count') do
      post :create, input_address: { address: @input_address.address, cryptocurrency_id: @input_address.cryptocurrency_id, status: @input_address.status }
    end

    assert_redirected_to input_address_path(assigns(:input_address))
  end

  test "should show input_address" do
    get :show, id: @input_address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @input_address
    assert_response :success
  end

  test "should update input_address" do
    patch :update, id: @input_address, input_address: { address: @input_address.address, cryptocurrency_id: @input_address.cryptocurrency_id, status: @input_address.status }
    assert_redirected_to input_address_path(assigns(:input_address))
  end

  test "should destroy input_address" do
    assert_difference('InputAddress.count', -1) do
      delete :destroy, id: @input_address
    end

    assert_redirected_to input_addresses_path
  end
end
