require "application_system_test_case"

class MasterBanksTest < ApplicationSystemTestCase
  setup do
    @master_bank = master_banks(:one)
  end

  test "visiting the index" do
    visit master_banks_url
    assert_selector "h1", text: "Master Banks"
  end

  test "creating a Master bank" do
    visit master_banks_url
    click_on "New Master Bank"

    fill_in "Balance Cents", with: @master_bank.balance_cents
    fill_in "Month", with: @master_bank.month
    fill_in "Year", with: @master_bank.year
    click_on "Create Master bank"

    assert_text "Master bank was successfully created"
    click_on "Back"
  end

  test "updating a Master bank" do
    visit master_banks_url
    click_on "Edit", match: :first

    fill_in "Balance Cents", with: @master_bank.balance_cents
    fill_in "Month", with: @master_bank.month
    fill_in "Year", with: @master_bank.year
    click_on "Update Master bank"

    assert_text "Master bank was successfully updated"
    click_on "Back"
  end

  test "destroying a Master bank" do
    visit master_banks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master bank was successfully destroyed"
  end
end
