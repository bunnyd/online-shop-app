class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :inventory, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
