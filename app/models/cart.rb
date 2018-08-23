class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def add_product(product_id)
    current_product = cart_products.find_by(product_id: product_id)
		if current_product
      current_product.quantity += 1
		else
			current_product = CartProduct.new(product_id: product_id, quantity:1, cart: self)
		end
		current_product
  end

  def total_price
    sum = 0
    quantity = 0
    self.cart_products.each do |cart_product|
      quantity = cart_product.quantity
      # byebug
      sum += cart_product.product.price.round(2) * quantity
    end
    sum
  end

  def checkout
    #check with seller inventory to see if have items
    #update seller inventory for each item have
    #run total price for item have
    #let users know if items not available
  end

  def list_of_products_in_seller_inventory
  end
end
