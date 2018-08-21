class Inventory < ApplicationRecord
  has_many :products

  belongs_to :user, as: :seller
    foreign_key :seller_id
    class: :User
end
