class Product < ApplicationRecord
  belongs_to :seller, foreign_key: 'seller_id', class_name: 'User'

  belongs_to :inventory

  has_many :cart_products
  has_many :carts, through: :cart_products

  validates :name, :price, :description, :seller, :quantity, presence: true
end
