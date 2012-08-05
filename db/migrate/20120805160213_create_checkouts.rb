class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|

      t.timestamps
    end
  end
end
