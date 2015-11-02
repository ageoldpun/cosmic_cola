require 'test_helper'

describe "Index" do
    it "loads the index" do
        visit "/"
        page.must_have_content("Cosmic Cola")
        page.must_have_content("12 Pack")
        page.must_have_content("24 Pack")
    end

    it "can navigate to /checkout" do
        click_link("Cart")
        page.must_have_content("Your Shopping Cart")
    end
end
