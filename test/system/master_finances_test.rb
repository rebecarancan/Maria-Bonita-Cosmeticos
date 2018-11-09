require "application_system_test_case"

class MasterFinancesTest < ApplicationSystemTestCase
  setup do
    @master_finance = master_finances(:one)
  end

  test "visiting the index" do
    visit master_finances_url
    assert_selector "h1", text: "Master Finances"
  end

  test "creating a Master finance" do
    visit master_finances_url
    click_on "New Master Finance"

    fill_in "Month", with: @master_finance.month
    click_on "Create Master finance"

    assert_text "Master finance was successfully created"
    click_on "Back"
  end

  test "updating a Master finance" do
    visit master_finances_url
    click_on "Edit", match: :first

    fill_in "Month", with: @master_finance.month
    click_on "Update Master finance"

    assert_text "Master finance was successfully updated"
    click_on "Back"
  end

  test "destroying a Master finance" do
    visit master_finances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master finance was successfully destroyed"
  end
end
