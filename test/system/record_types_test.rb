require "application_system_test_case"

class RecordTypesTest < ApplicationSystemTestCase
  setup do
    @record_type = record_types(:one)
  end

  test "visiting the index" do
    visit record_types_url
    assert_selector "h1", text: "Record Types"
  end

  test "creating a Record type" do
    visit record_types_url
    click_on "New Record Type"

    fill_in "Name", with: @record_type.name
    click_on "Create Record type"

    assert_text "Record type was successfully created"
    click_on "Back"
  end

  test "updating a Record type" do
    visit record_types_url
    click_on "Edit", match: :first

    fill_in "Name", with: @record_type.name
    click_on "Update Record type"

    assert_text "Record type was successfully updated"
    click_on "Back"
  end

  test "destroying a Record type" do
    visit record_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Record type was successfully destroyed"
  end
end
