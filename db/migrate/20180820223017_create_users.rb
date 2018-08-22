class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :role, default: "customer"
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :credit_card_number
      t.boolean :is_seller, default: false

      t.timestamps
    end
  end
end
