require "application_system_test_case"

class IncomeKindsTest < ApplicationSystemTestCase
  setup do
    @income_kind = income_kinds(:one)
  end

  test "visiting the index" do
    visit income_kinds_url
    assert_selector "h1", text: "Income Kinds"
  end

  test "creating a Income kind" do
    visit income_kinds_url
    click_on "New Income Kind"

    fill_in "Name", with: @income_kind.name
    click_on "Create Income kind"

    assert_text "Income kind was successfully created"
    click_on "Back"
  end

  test "updating a Income kind" do
    visit income_kinds_url
    click_on "Edit", match: :first

    fill_in "Name", with: @income_kind.name
    click_on "Update Income kind"

    assert_text "Income kind was successfully updated"
    click_on "Back"
  end

  test "destroying a Income kind" do
    visit income_kinds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Income kind was successfully destroyed"
  end
end
