require "application_system_test_case"

class MasterOrdersTest < ApplicationSystemTestCase
  setup do
    @master_order = master_orders(:one)
  end

  test "visiting the index" do
    visit master_orders_url
    assert_selector "h1", text: "Master Orders"
  end

  test "creating a Master order" do
    visit master_orders_url
    click_on "New Master Order"

    fill_in "Month", with: @master_order.month
    fill_in "Year", with: @master_order.year
    click_on "Create Master order"

    assert_text "Master order was successfully created"
    click_on "Back"
  end

  test "updating a Master order" do
    visit master_orders_url
    click_on "Edit", match: :first

    fill_in "Month", with: @master_order.month
    fill_in "Year", with: @master_order.year
    click_on "Update Master order"

    assert_text "Master order was successfully updated"
    click_on "Back"
  end

  test "destroying a Master order" do
    visit master_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master order was successfully destroyed"
  end
end
