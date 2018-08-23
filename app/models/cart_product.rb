class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, :cart, :product, presence: true

  def total_price
    product.price*quantity
  end
end
