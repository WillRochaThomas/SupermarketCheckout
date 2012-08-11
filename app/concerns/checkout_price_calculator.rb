module CheckoutPriceCalculator
  extend ActiveSupport::Concern

  def checkout_price_for (item)
    item.price
  end

end