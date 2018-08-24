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
    self.cart_products.each do |cart_product|
      quantity = cart_product.quantity
      sum += (cart_product.product.price.round(2) * quantity)
    end
    sum.round(2)
  end

  def final_total_price
    sum = 0
    in_stock = hsh_of_products_in_seller_inventory
    in_stock.each do |product, quantity|
      sum += product.price * quantity
    end
    sum.round(2)
  end

  def checkout
    to_be_sold = hsh_of_products_in_seller_inventory
    no_longer_in_stock = not_in_stock
    reduce_inventory(to_be_sold)
    [to_be_sold, self.final_total_price, no_longer_in_stock]
  end

  def hsh_of_products_in_seller_inventory
    selected = Hash.new(0)
    self.cart_products.each do |cart_product|
      inventory = cart_product.product.inventory
      product_name = cart_product.product.name
      if inventory.product_available(product_name) && inventory.verify_quantity(product_name) <= cart_product.quantity
        selected[cart_product.product] += cart_product.quantity
      end
    end
    selected
  end

  def not_in_stock
    to_be_sold = hsh_of_products_in_seller_inventory
    returned = self.products.reject { |product| to_be_sold.keys.include?(product) }
  end

  def reduce_inventory(in_stock)
    in_stock.each do |product, quantity|
      inventory = product.inventory
      inventory.decrease_quantity(product.name, quantity)
    end
  end

  def clean_cart
    CartProduct.all.select { |cart_product| cart_product.cart_id == self.id }.map { |cp| cp.destroy }
  end
end
