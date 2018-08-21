class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id, index: true, foreign_key: true
      t.integer :seller_id, index: true, foreign_key: true
      t.boolean :is_complete

      t.timestamps
    end
  end
end
