require 'test_helper'

class MasterSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_sale = master_sales(:one)
  end

  test "should get index" do
    get master_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_master_sale_url
    assert_response :success
  end

  test "should create master_sale" do
    assert_difference('MasterSale.count') do
      post master_sales_url, params: { master_sale: { balance_cents: @master_sale.balance_cents, month: @master_sale.month, year: @master_sale.year } }
    end

    assert_redirected_to master_sale_url(MasterSale.last)
  end

  test "should show master_sale" do
    get master_sale_url(@master_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_sale_url(@master_sale)
    assert_response :success
  end

  test "should update master_sale" do
    patch master_sale_url(@master_sale), params: { master_sale: { balance_cents: @master_sale.balance_cents, month: @master_sale.month, year: @master_sale.year } }
    assert_redirected_to master_sale_url(@master_sale)
  end

  test "should destroy master_sale" do
    assert_difference('MasterSale.count', -1) do
      delete master_sale_url(@master_sale)
    end

    assert_redirected_to master_sales_url
  end
end
