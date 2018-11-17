require "application_system_test_case"

class MasterSalesTest < ApplicationSystemTestCase
  setup do
    @master_sale = master_sales(:one)
  end

  test "visiting the index" do
    visit master_sales_url
    assert_selector "h1", text: "Master Sales"
  end

  test "creating a Master sale" do
    visit master_sales_url
    click_on "New Master Sale"

    fill_in "Balance Cents", with: @master_sale.balance_cents
    fill_in "Month", with: @master_sale.month
    fill_in "Year", with: @master_sale.year
    click_on "Create Master sale"

    assert_text "Master sale was successfully created"
    click_on "Back"
  end

  test "updating a Master sale" do
    visit master_sales_url
    click_on "Edit", match: :first

    fill_in "Balance Cents", with: @master_sale.balance_cents
    fill_in "Month", with: @master_sale.month
    fill_in "Year", with: @master_sale.year
    click_on "Update Master sale"

    assert_text "Master sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Master sale" do
    visit master_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Master sale was successfully destroyed"
  end
end
