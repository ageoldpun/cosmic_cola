require "test_helper"
require "email_spec"

describe "Index" do
  it "loads the index" do
    visit "/"
    page.must_have_content("Cosmic Cola")
    page.must_have_content("12 Pack")
    page.must_have_content("24 Pack")
  end

  it "can navigate to /checkout" do
    visit "/"
    click_link("Cart")
    page.must_have_content("Your Shopping Cart")
  end
end

describe "Complete order" do
  it "can complete an order" do
    visit "/"
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
  end

  it "sends an email" do
    test_email = open_last_email
    assert_match "Someone bought some of your cola", test_email.to_s
    assert_match "123 SW 1st Street", test_email.to_s
  end
end
