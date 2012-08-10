class AddPriceToBasketItem < ActiveRecord::Migration
  def change
    add_column :basket_items, :price, :decimal
  end
end
