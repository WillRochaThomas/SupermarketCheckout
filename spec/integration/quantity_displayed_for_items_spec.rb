require 'spec_helper'

describe "Adding one item to my basket and checking out" do
  include_context "add_to_basket"

  it "should show a quantity of 1" do
    a_product = Product.create(:name => 'my product', :price => 9.88)
    add_product_to_basket(a_product)

    click_button('Checkout')

    page.should have_content('1')
  end
end

describe "Adding two items to my basket and checking out" do
  include_context "add_to_basket"

  it "should show a quantity of 2" do
    a_product = Product.create(:name => 'my product', :price => 9.88)
    add_product_to_basket(a_product)
    add_product_to_basket(a_product)

    click_button('Checkout')

    page.should have_content('2')
  end
end