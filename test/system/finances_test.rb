require "application_system_test_case"

class FinancesTest < ApplicationSystemTestCase
  setup do
    @finance = finances(:one)
  end

  test "visiting the index" do
    visit finances_url
    assert_selector "h1", text: "Finances"
  end

  test "creating a Finance" do
    visit finances_url
    click_on "New Finance"

    fill_in "Day", with: @finance.day
    fill_in "Description", with: @finance.description
    fill_in "Expense Type", with: @finance.expense_type_id
    fill_in "Record Type", with: @finance.record_type_id
    fill_in "Value", with: @finance.value
    click_on "Create Finance"

    assert_text "Finance was successfully created"
    click_on "Back"
  end

  test "updating a Finance" do
    visit finances_url
    click_on "Edit", match: :first

    fill_in "Day", with: @finance.day
    fill_in "Description", with: @finance.description
    fill_in "Expense Type", with: @finance.expense_type_id
    fill_in "Record Type", with: @finance.record_type_id
    fill_in "Value", with: @finance.value
    click_on "Update Finance"

    assert_text "Finance was successfully updated"
    click_on "Back"
  end

  test "destroying a Finance" do
    visit finances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Finance was successfully destroyed"
  end
end
