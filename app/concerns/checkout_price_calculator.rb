module CheckoutPriceCalculator
  extend ActiveSupport::Concern

  def checkout_price_for (item)
    raise ArgumentError, 'Invalid argument for item quantity: ' + item.quantity.to_s + '. It must be at least 1' if item.quantity < 1

    item.quantity * item.price
  end

end