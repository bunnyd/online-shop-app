class Inventory < ApplicationRecord
  belongs_to :seller, foreign_key: "seller_id", class_name: :User
  has_many :products
  accepts_nested_attributes_for :products

  def store_name
    "#{seller.username}'s store"
  end

  def seller_username
    self.seller.username
  end

  def product_available(product_name)
    product = find_product(product_name)

    if product && product.quantity > 0
      return true
    else
      false
    end
  end

  def find_product(product_name)
    product = Product.find_by(name: product_name)
  end

  def verify_quantity(product_name)
    available = find_product(product_name)

    available ? available.quantity : 0
  end

  def decrease_quantity(product_name, quantity)
    product_available = find_product(product_name)

    if product_available && verify_quantity(product_name) >= quantity
      product_available.quantity -= quantity
      return true
    else
      return false
    end
  end

  def increase_quantity(product_name, quantity)
    new_quantity = quantity * -1
    self.decrease_quantity(product_name, new_quantity)
  end

  def create_product(info)
    Product.create(info)
  end

  def add_product(product_info)
    product = self.create_product(product_info)
    product ? true : false
  end

  def self.most_commonly_stocked_product
    hsh = self.inventory_products_hsh
    hsh.max.first
  end

  def self.inventory_products_hsh
    hsh = Hash.new(0)

    self.all.each do |inventory|
      inventory.products.each do |product|
        hsh[product.name] += product.quantity
      end
    end

    hsh
  end

end
