require 'spec_helper'
require 'ramcrest'

describe Checkout do
  include Ramcrest::EqualTo

  describe "Checkout total" do
    it "should match the total price of all items scanned" do
      checkout = Checkout.create
      top_seller = Product.create(:price => 1.00)
      item_in_my_basket = BasketItem.create(:product => top_seller)

      checkout.scan(item_in_my_basket)
      checkout.scan(item_in_my_basket)

      assert_that checkout.total, equal_to(2.00)
    end

    it "should be 0.00 if no items have been scanned" do
      checkout = Checkout.create
      assert_that checkout.total, equal_to(0.00)
    end
  end

  describe "Checkout basket items" do
    it "should contain an item with a quantity of 2 if the same product has been scanned twice " do
      checkout = Checkout.create
      top_seller = Product.create(:price => 1.00)
      first_item = BasketItem.create(:product => top_seller)
      second_item = BasketItem.create(:product => top_seller)

      checkout.scan(first_item)
      checkout.scan(second_item)

      checkout.basket_items.should have(1).items
      item_in_basket = checkout.basket_items.first
      assert_that item_in_basket.quantity, equal_to(2)
    end
  end

end
