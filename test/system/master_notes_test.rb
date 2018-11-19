require "application_system_test_case"

class MasterNotesTest < ApplicationSystemTestCase
  setup do
    @master_note = master_notes(:one)
  end

  test "visiting the index" do
    visit master_notes_url
    assert_selector "h1", text: "Master Notes"
  end

  test "creating a Master note" do
    visit master_notes_url
    click_on "New Master Note"

    fill_in "Month", with: @master_note.month
    fill_in "Year", with: @master_note.year
    click_on "Create Master note"

    assert_text "Master note was successfully created"
    click_on "Back"
  end

  test "updating a Master note" do
    visit master_notes_url
    click_on "Edit", match: :first

    fill_in "Month", with: @master_note.month
    fill_in "Year", with: @master_note.year
    click_on "Update Master note"

    assert_text "Master note was successfully updated"
    click_on "Back"
  end

  test "destroying a Master note" do
    visit master_notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master note was successfully destroyed"
  end
end
