class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def add_product(product_id)
    current_product = inventory.products.find_by(product_id: product_id)
    if current_product
      current_product.quantity += 1
    else
      current_product = inventory.products.build(product_id: product_id)
    end
    current_product
  end

  # def total_price
  #   products.to_a.sum { |product| product.total_price }
  # end

end
