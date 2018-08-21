class Inventory < ApplicationRecord
  has_many :products

  belongs_to :seller,
    class_name: :User
end
