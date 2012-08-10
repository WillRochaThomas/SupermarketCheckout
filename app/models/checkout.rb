class Checkout < ActiveRecord::Base
  has_many :basket_items, :dependent => :destroy

  def scan (item)
    basket_items << item
  end

  def total
    total = 0

    basket_items.each do |item|
      total += item.price
    end

    return total
  end
end
