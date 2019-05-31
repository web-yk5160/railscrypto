require "application_system_test_case"

class VirtualsTest < ApplicationSystemTestCase
  setup do
    @virtual = virtuals(:one)
  end

  test "visiting the index" do
    visit virtuals_url
    assert_selector "h1", text: "Virtuals"
  end

  test "creating a Virtual" do
    visit virtuals_url
    click_on "New Virtual"

    fill_in "Amount owned", with: @virtual.amount_owned
    fill_in "Cost per", with: @virtual.cost_per
    fill_in "Symbol", with: @virtual.symbol
    fill_in "User", with: @virtual.user_id
    click_on "Create Virtual"

    assert_text "Virtual was successfully created"
    click_on "Back"
  end

  test "updating a Virtual" do
    visit virtuals_url
    click_on "Edit", match: :first

    fill_in "Amount owned", with: @virtual.amount_owned
    fill_in "Cost per", with: @virtual.cost_per
    fill_in "Symbol", with: @virtual.symbol
    fill_in "User", with: @virtual.user_id
    click_on "Update Virtual"

    assert_text "Virtual was successfully updated"
    click_on "Back"
  end

  test "destroying a Virtual" do
    visit virtuals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Virtual was successfully destroyed"
  end
end
