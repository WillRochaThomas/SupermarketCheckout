class Product < ActiveRecord::Base
  has_many :basket_items, :dependent => :restrict

  attr_accessible :name, :price, :product_code
end
