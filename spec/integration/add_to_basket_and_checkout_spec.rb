require 'spec_helper'

describe "Click the checkout button after adding an item to your basket" do

  it "should load the checkout page and show the item you added in the order summary" do
    a_product = Product.create
    a_product.name = 'my product'
    a_product.price = '100.76'
    url_of_a_product = product_path(a_product)
    visit(url_of_a_product)

    click_button('Add to Basket')
    click_button('Checkout')

    page.should contain('my product')
    page.should contain('100.76')
  end
end