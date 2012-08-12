#coding: utf-8
require 'spec_helper'

describe "Click the checkout button after adding an item to your basket" do
  include_context "add_to_basket"

  it "should load the checkout page and show the item you added in the order summary" do
    a_product = Product.create(:name => 'my product', :price => 100.76)

    add_product_to_basket(a_product)
    click_button('Checkout')

    page.should have_content('my product')
    page.should have_content('£100.76')
  end
end