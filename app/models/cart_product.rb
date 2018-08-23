class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, :cart, :product, presence: true

end
