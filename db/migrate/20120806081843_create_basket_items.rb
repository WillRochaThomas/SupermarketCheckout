class CreateBasketItems < ActiveRecord::Migration
  def change
    create_table :basket_items do |t|
      t.integer :product_id
      t.integer :checkout_id

      t.timestamps
    end
  end
end
