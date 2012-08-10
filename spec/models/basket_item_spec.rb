require 'spec_helper'
require 'ramcrest'

describe "price" do
  include Ramcrest::EqualTo

  it "should return the price of the product this basket item references" do
    product_we_picked = mock_model(Product, :price => 1.00)
    item_in_basket = BasketItem.create(:product => product_we_picked)

    assert_that item_in_basket.price, equal_to(1.00)
  end
end