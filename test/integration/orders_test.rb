require "test_helper"
require "email_spec"

describe "Placing an order" do
  it "can place an order" do
    visit "/"
    page.must_have_content("Cosmic Cola")
    page.must_have_content("12 Pack")
    page.must_have_content("24 Pack")
    click_button("12-pack")
    page.must_have_content("Cart (1)")
    page.must_have_content("12 Pack")
    fill_in("First Name", with: "Paul")
    fill_in("Last Name", with: "Ogden")
    fill_in("Address", with: "123 SW 1st Street")
    fill_in("City", with: "Portland")
    select("Oregon", from: "State")
    fill_in("Zip", with: "97205")
    click_button("Complete Order")
    page.must_have_content("Your order was submitted successfully!")
    test_email = open_last_email
    assert_match "Someone bought some of your cola", test_email.to_s
    assert_match "123 SW 1st Street", test_email.to_s
  end
end
