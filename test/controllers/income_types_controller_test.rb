require 'test_helper'

class IncomeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income_type = income_types(:one)
  end

  test "should get index" do
    get income_types_url
    assert_response :success
  end

  test "should get new" do
    get new_income_type_url
    assert_response :success
  end

  test "should create income_type" do
    assert_difference('IncomeType.count') do
      post income_types_url, params: { income_type: { name: @income_type.name } }
    end

    assert_redirected_to income_type_url(IncomeType.last)
  end

  test "should show income_type" do
    get income_type_url(@income_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_income_type_url(@income_type)
    assert_response :success
  end

  test "should update income_type" do
    patch income_type_url(@income_type), params: { income_type: { name: @income_type.name } }
    assert_redirected_to income_type_url(@income_type)
  end

  test "should destroy income_type" do
    assert_difference('IncomeType.count', -1) do
      delete income_type_url(@income_type)
    end

    assert_redirected_to income_types_url
  end
end
