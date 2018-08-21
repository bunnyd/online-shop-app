class CreateProductInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :product_inventories do |t|
      t.belongs_to :inventory
      t.belongs_to :product
      t.integer :quantity

      t.timestamps
    end
  end
end
