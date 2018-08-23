class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def add_product(product_id)
    current_product = cart_products.find_by(product_id: product_id)
    # byebug
    # byebug
		if current_product
      # byebug
      current_product.quantity += 1
      # if current_product.quantity == nil
      #   current_product.quantity = 1
      # else
      #
      # end
		else
			current_product = cart_products.build(product_id: product_id)
		end
		current_product
  end

  def total_price
    # byebug
    sum = 0
    quantity = 0
    self.cart_products.each do |cart_product|
      quantity = cart_product.quantity
      # byebug
      sum += cart_product.product.price.round(2) * quantity
    end
    sum
  end
end
