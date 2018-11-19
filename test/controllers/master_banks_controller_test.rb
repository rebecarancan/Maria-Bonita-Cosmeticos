require 'test_helper'

class MasterBanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_bank = master_banks(:one)
  end

  test "should get index" do
    get master_banks_url
    assert_response :success
  end

  test "should get new" do
    get new_master_bank_url
    assert_response :success
  end

  test "should create master_bank" do
    assert_difference('MasterBank.count') do
      post master_banks_url, params: { master_bank: { balance_cents: @master_bank.balance_cents, month: @master_bank.month, year: @master_bank.year } }
    end

    assert_redirected_to master_bank_url(MasterBank.last)
  end

  test "should show master_bank" do
    get master_bank_url(@master_bank)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_bank_url(@master_bank)
    assert_response :success
  end

  test "should update master_bank" do
    patch master_bank_url(@master_bank), params: { master_bank: { balance_cents: @master_bank.balance_cents, month: @master_bank.month, year: @master_bank.year } }
    assert_redirected_to master_bank_url(@master_bank)
  end

  test "should destroy master_bank" do
    assert_difference('MasterBank.count', -1) do
      delete master_bank_url(@master_bank)
    end

    assert_redirected_to master_banks_url
  end
end
