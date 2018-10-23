require "application_system_test_case"

class ExpenseTypesTest < ApplicationSystemTestCase
  setup do
    @expense_type = expense_types(:one)
  end

  test "visiting the index" do
    visit expense_types_url
    assert_selector "h1", text: "Expense Types"
  end

  test "creating a Expense type" do
    visit expense_types_url
    click_on "New Expense Type"

    fill_in "Name", with: @expense_type.name
    click_on "Create Expense type"

    assert_text "Expense type was successfully created"
    click_on "Back"
  end

  test "updating a Expense type" do
    visit expense_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @expense_type.name
    click_on "Update Expense type"

    assert_text "Expense type was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense type" do
    visit expense_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense type was successfully destroyed"
  end
end
