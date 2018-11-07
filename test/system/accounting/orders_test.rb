require "application_system_test_case"

class Accounting::OrdersTest < ApplicationSystemTestCase
  setup do
    @accounting_order = accounting_orders(:one)
  end

  test "visiting the index" do
    visit accounting_orders_url
    assert_selector "h1", text: "Accounting/Orders"
  end

  test "creating a Order" do
    visit accounting_orders_url
    click_on "New Accounting/Order"

    fill_in "Day", with: @accounting_order.day
    fill_in "Distributor", with: @accounting_order.distributor
    fill_in "Payment", with: @accounting_order.payment_id
    fill_in "Value", with: @accounting_order.value
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit accounting_orders_url
    click_on "Edit", match: :first

    fill_in "Day", with: @accounting_order.day
    fill_in "Distributor", with: @accounting_order.distributor
    fill_in "Payment", with: @accounting_order.payment_id
    fill_in "Value", with: @accounting_order.value
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit accounting_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
