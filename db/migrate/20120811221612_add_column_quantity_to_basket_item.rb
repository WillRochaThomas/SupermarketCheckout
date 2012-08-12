class AddColumnQuantityToBasketItem < ActiveRecord::Migration
  def change
    add_column :basket_items, :quantity, :integer, :default => 1
  end
end
