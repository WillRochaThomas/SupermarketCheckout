class Checkout < ActiveRecord::Base
  include CheckoutPriceCalculator
  has_many :basket_items, :dependent => :destroy

  def scan (item)
    basket_items << item
  end

  def total
    total = 0

    basket_items.each do |item|
      price = checkout_price_for(item)
      total += price
    end

    return total
  end
end
