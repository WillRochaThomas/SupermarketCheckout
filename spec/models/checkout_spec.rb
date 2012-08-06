require 'spec_helper'
require 'ramcrest'

describe Checkout do
  include Ramcrest::EqualTo

  describe "total" do
    it "should correctly calculate the total price of all items scanned" do
      checkout = Checkout.new
      product = double("Product")
      product.stub(:price) { 1.00 }
      checkout.scan(product)
      checkout.scan(product)
      assert_that checkout.total, equal_to(2.00)
    end
  end
end
