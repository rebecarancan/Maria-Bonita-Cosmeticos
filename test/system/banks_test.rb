require "application_system_test_case"

class BanksTest < ApplicationSystemTestCase
  setup do
    @bank = banks(:one)
  end

  test "visiting the index" do
    visit banks_url
    assert_selector "h1", text: "Banks"
  end

  test "creating a Bank" do
    visit banks_url
    click_on "New Bank"

    fill_in "Day", with: @bank.day
    fill_in "Income Type", with: @bank.income_type_id
    fill_in "Record Type", with: @bank.record_type_id
    fill_in "Value", with: @bank.value
    click_on "Create Bank"

    assert_text "Bank was successfully created"
    click_on "Back"
  end

  test "updating a Bank" do
    visit banks_url
    click_on "Edit", match: :first

    fill_in "Day", with: @bank.day
    fill_in "Income Type", with: @bank.income_type_id
    fill_in "Record Type", with: @bank.record_type_id
    fill_in "Value", with: @bank.value
    click_on "Update Bank"

    assert_text "Bank was successfully updated"
    click_on "Back"
  end

  test "destroying a Bank" do
    visit banks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bank was successfully destroyed"
  end
end
