class Checkout < ActiveRecord::Base
  include CheckoutPriceCalculator
  has_many :basket_items, :dependent => :destroy

  def scan (item)
    item_already_in_basket = basket_items.find_by_product_id(item.product.id)

    if item_already_in_basket
      item_already_in_basket.quantity += 1
      item_already_in_basket.save!
    else
      basket_items << item
    end
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
