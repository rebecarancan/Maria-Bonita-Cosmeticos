require 'test_helper'

class MasterOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_order = master_orders(:one)
  end

  test "should get index" do
    get master_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_master_order_url
    assert_response :success
  end

  test "should create master_order" do
    assert_difference('MasterOrder.count') do
      post master_orders_url, params: { master_order: { month: @master_order.month, year: @master_order.year } }
    end

    assert_redirected_to master_order_url(MasterOrder.last)
  end

  test "should show master_order" do
    get master_order_url(@master_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_order_url(@master_order)
    assert_response :success
  end

  test "should update master_order" do
    patch master_order_url(@master_order), params: { master_order: { month: @master_order.month, year: @master_order.year } }
    assert_redirected_to master_order_url(@master_order)
  end

  test "should destroy master_order" do
    assert_difference('MasterOrder.count', -1) do
      delete master_order_url(@master_order)
    end

    assert_redirected_to master_orders_url
  end
end
