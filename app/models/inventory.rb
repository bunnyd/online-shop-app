class Inventory < ApplicationRecord
  has_many :product_inventories
  has_many :products, through: :product_inventories

  belongs_to :seller,
    class_name: :User
end
