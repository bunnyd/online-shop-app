class Product < ApplicationRecord
  belongs_to :seller, foreign_key: 'seller_id', class_name: 'User'

  belongs_to :inventory

  has_many :cart_products
  has_many :carts, through: :cart_products

  def total_price
    product.cart_products[0].quantity * product.price.to_f.round(2)
  end
end
