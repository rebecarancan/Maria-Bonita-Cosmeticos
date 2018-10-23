require 'test_helper'

class RecordTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record_type = record_types(:one)
  end

  test "should get index" do
    get record_types_url
    assert_response :success
  end

  test "should get new" do
    get new_record_type_url
    assert_response :success
  end

  test "should create record_type" do
    assert_difference('RecordType.count') do
      post record_types_url, params: { record_type: { name: @record_type.name } }
    end

    assert_redirected_to record_type_url(RecordType.last)
  end

  test "should show record_type" do
    get record_type_url(@record_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_type_url(@record_type)
    assert_response :success
  end

  test "should update record_type" do
    patch record_type_url(@record_type), params: { record_type: { name: @record_type.name } }
    assert_redirected_to record_type_url(@record_type)
  end

  test "should destroy record_type" do
    assert_difference('RecordType.count', -1) do
      delete record_type_url(@record_type)
    end

    assert_redirected_to record_types_url
  end
end
