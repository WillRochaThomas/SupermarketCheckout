class BasketItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :checkout

  attr_accessible :product

  def price
    product.price
  end

end
