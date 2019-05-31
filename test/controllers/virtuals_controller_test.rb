require 'test_helper'

class VirtualsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @virtual = virtuals(:one)
  end

  test "should get index" do
    get virtuals_url
    assert_response :success
  end

  test "should get new" do
    get new_virtual_url
    assert_response :success
  end

  test "should create virtual" do
    assert_difference('Virtual.count') do
      post virtuals_url, params: { virtual: { amount_owned: @virtual.amount_owned, cost_per: @virtual.cost_per, symbol: @virtual.symbol, user_id: @virtual.user_id } }
    end

    assert_redirected_to virtual_url(Virtual.last)
  end

  test "should show virtual" do
    get virtual_url(@virtual)
    assert_response :success
  end

  test "should get edit" do
    get edit_virtual_url(@virtual)
    assert_response :success
  end

  test "should update virtual" do
    patch virtual_url(@virtual), params: { virtual: { amount_owned: @virtual.amount_owned, cost_per: @virtual.cost_per, symbol: @virtual.symbol, user_id: @virtual.user_id } }
    assert_redirected_to virtual_url(@virtual)
  end

  test "should destroy virtual" do
    assert_difference('Virtual.count', -1) do
      delete virtual_url(@virtual)
    end

    assert_redirected_to virtuals_url
  end
end
