require 'spec_helper'
require 'ramcrest'

describe Checkout do
  include Ramcrest::EqualTo

  describe "total" do
    it "should correctly calculate the total price of all items scanned" do
      checkout = Checkout.new
      item_in_my_basket = mock_model(BasketItem, :price => 1.00)

      checkout.scan(item_in_my_basket)
      checkout.scan(item_in_my_basket)

      assert_that checkout.total, equal_to(2.00)
    end
  end

  describe "total" do
    it "should be 0.00 if no items have been scanned" do
      checkout = Checkout.new
      assert_that checkout.total, equal_to(0.00)
    end
  end
end
