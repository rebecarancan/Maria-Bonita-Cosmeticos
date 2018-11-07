require 'test_helper'

class Accounting::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accounting_order = accounting_orders(:one)
  end

  test "should get index" do
    get accounting_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_accounting_order_url
    assert_response :success
  end

  test "should create accounting_order" do
    assert_difference('Accounting::Order.count') do
      post accounting_orders_url, params: { accounting_order: { day: @accounting_order.day, distributor: @accounting_order.distributor, payment_id: @accounting_order.payment_id, value: @accounting_order.value } }
    end

    assert_redirected_to accounting_order_url(Accounting::Order.last)
  end

  test "should show accounting_order" do
    get accounting_order_url(@accounting_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_accounting_order_url(@accounting_order)
    assert_response :success
  end

  test "should update accounting_order" do
    patch accounting_order_url(@accounting_order), params: { accounting_order: { day: @accounting_order.day, distributor: @accounting_order.distributor, payment_id: @accounting_order.payment_id, value: @accounting_order.value } }
    assert_redirected_to accounting_order_url(@accounting_order)
  end

  test "should destroy accounting_order" do
    assert_difference('Accounting::Order.count', -1) do
      delete accounting_order_url(@accounting_order)
    end

    assert_redirected_to accounting_orders_url
  end
end
