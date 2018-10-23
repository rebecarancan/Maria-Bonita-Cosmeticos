require 'test_helper'

class FinancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @finance = finances(:one)
  end

  test "should get index" do
    get finances_url
    assert_response :success
  end

  test "should get new" do
    get new_finance_url
    assert_response :success
  end

  test "should create finance" do
    assert_difference('Finance.count') do
      post finances_url, params: { finance: { day: @finance.day, description: @finance.description, expense_type_id: @finance.expense_type_id, record_type_id: @finance.record_type_id, value: @finance.value } }
    end

    assert_redirected_to finance_url(Finance.last)
  end

  test "should show finance" do
    get finance_url(@finance)
    assert_response :success
  end

  test "should get edit" do
    get edit_finance_url(@finance)
    assert_response :success
  end

  test "should update finance" do
    patch finance_url(@finance), params: { finance: { day: @finance.day, description: @finance.description, expense_type_id: @finance.expense_type_id, record_type_id: @finance.record_type_id, value: @finance.value } }
    assert_redirected_to finance_url(@finance)
  end

  test "should destroy finance" do
    assert_difference('Finance.count', -1) do
      delete finance_url(@finance)
    end

    assert_redirected_to finances_url
  end
end
