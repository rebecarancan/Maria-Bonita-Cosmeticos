require 'test_helper'

class MasterFinancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_finance = master_finances(:one)
  end

  test "should get index" do
    get master_finances_url
    assert_response :success
  end

  test "should get new" do
    get new_master_finance_url
    assert_response :success
  end

  test "should create master_finance" do
    assert_difference('MasterFinance.count') do
      post master_finances_url, params: { master_finance: { month: @master_finance.month } }
    end

    assert_redirected_to master_finance_url(MasterFinance.last)
  end

  test "should show master_finance" do
    get master_finance_url(@master_finance)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_finance_url(@master_finance)
    assert_response :success
  end

  test "should update master_finance" do
    patch master_finance_url(@master_finance), params: { master_finance: { month: @master_finance.month } }
    assert_redirected_to master_finance_url(@master_finance)
  end

  test "should destroy master_finance" do
    assert_difference('MasterFinance.count', -1) do
      delete master_finance_url(@master_finance)
    end

    assert_redirected_to master_finances_url
  end
end
