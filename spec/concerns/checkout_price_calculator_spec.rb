require 'spec_helper'
require 'ramcrest'

class Calculator
  include CheckoutPriceCalculator
end

describe "checkout_price_for" do
  include Ramcrest::EqualTo

  before(:each) do
    @calculator = Calculator.new
  end

  it "should return the unit price of the item, if the quantity is 1" do
    single_item  = mock_model(BasketItem, :price => 2.22, :quantity => 1)

    checkout_price = @calculator.checkout_price_for(single_item)

    assert_that checkout_price, equal_to(2.22)
  end

  it "should return the unit price times the quantity, if quantity is greater than 1" do
    three_of_one_item  = mock_model(BasketItem, :price => 2.22, :quantity => 3)

    checkout_price = @calculator.checkout_price_for(three_of_one_item)

    assert_that checkout_price, equal_to(6.66)
  end

  it "should raise an ArgumentError if the item quantity is less than 1" do
    item_with_zero_quantity  = mock_model(BasketItem, :price => 2.22, :quantity => 0)

    expect{ @calculator.checkout_price_for(item_with_zero_quantity) }.to raise_error(ArgumentError, 'Invalid argument for item quantity: 0. It must be at least 1')
  end
end
