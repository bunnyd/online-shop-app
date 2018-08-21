class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.integer :seller_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
