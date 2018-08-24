class Product < ApplicationRecord
  belongs_to :seller, foreign_key: 'seller_id', class_name: 'User'

  belongs_to :inventory

  has_many :cart_products
  has_many :carts, through: :cart_products

  validates :name, :price, :description, :seller, :quantity, presence: true

  def total_price(cart)
    selected_product = cart.products.select { |product| product.id == self.id }
    self.price.to_f.round(2)
  end
end
