#coding: utf-8
require 'spec_helper'

describe "Click the checkout button after adding an item to your basket" do

  it "should load the checkout page and show the item you added in the order summary" do
    a_product = Product.create(:name => 'my product', :price => 100.76)

    url_of_a_product = product_path(a_product)
    visit(url_of_a_product)

    click_button('Add to Basket')
    click_button('Checkout')

    page.should have_content('my product')
    page.should have_content('£100.76')
  end
end