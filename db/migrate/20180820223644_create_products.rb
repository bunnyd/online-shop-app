class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :seller_id
      t.belongs_to :inventory, foreign_key: true

      t.timestamps
    end
  end
end
