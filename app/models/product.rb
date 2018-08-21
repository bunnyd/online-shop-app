class Product < ApplicationRecord
  belongs_to :seller,
    class_name: :User
  has_many :product_inventories
  has_many :inventories, through: :product_inventories

  has_many :cart_products
  has_many :carts, through: :cart_products
end
