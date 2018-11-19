require 'test_helper'

class MasterNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @master_note = master_notes(:one)
  end

  test "should get index" do
    get master_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_master_note_url
    assert_response :success
  end

  test "should create master_note" do
    assert_difference('MasterNote.count') do
      post master_notes_url, params: { master_note: { month: @master_note.month, year: @master_note.year } }
    end

    assert_redirected_to master_note_url(MasterNote.last)
  end

  test "should show master_note" do
    get master_note_url(@master_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_master_note_url(@master_note)
    assert_response :success
  end

  test "should update master_note" do
    patch master_note_url(@master_note), params: { master_note: { month: @master_note.month, year: @master_note.year } }
    assert_redirected_to master_note_url(@master_note)
  end

  test "should destroy master_note" do
    assert_difference('MasterNote.count', -1) do
      delete master_note_url(@master_note)
    end

    assert_redirected_to master_notes_url
  end
end
