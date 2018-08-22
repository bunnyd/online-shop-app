require 'rails_helper'

RSpec.describe Inventory, type: :model do

  let(:bman) { User.create(username: "Batman", first_name: "Bruce", last_name: "Wayne", credit_card_number: 101011110000, is_seller: true, email: "bman@wayne_industries.net", password: "not_password") }


  let(:not_bman) { User.create(username: "Not Batman", first_name: "Not Bruce", last_name: "Not Wayne", credit_card_number: 101011110000, is_seller: true, email: "not_bman@wayne_industries.net", password: "password") }

  let(:bman_inventory) { Inventory.create(seller: bman) }

  let(:valid_product) { Product.create(name: "candy", price: 11.00, description: "a sweet for the sweet", seller: bman, inventory: bman_inventory)
  }

  let(:bman_cart) { Cart.create(user: bman) }

  let(:not_bman_cart) { Cart.create(user: bman) }

  let(:cart_product_1) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 2) }

  let(:cart_product_2) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 3) }

  let(:cart_product_3) { CartProduct.create(cart: not_bman_cart, product: valid_product, quantity: 3) }

  it 'is valid with valid attributes' do
    expect(bman_inventory).to be_valid
  end

  it 'is invalid without a seller' do
    bman_inventory.seller = nil
    expect(bman_inventory).to_not be_valid
  end

  it 'has many products'
  it '#item_available accepts a product name and returns if the item is available'
  it '#verify_quantity accepts a product name and returns how many of that item is in the seller\'s inventory'
  it '#decrease_quantity takes a product name and a quantity, and returns true if item quantity in seller\'s inventory has decreased'
  it '#increase_quantity takes a product name and a quantity, and returns true if item quantity in seller\'s inventory has increased'
  it '#add_product takes a product and a number, and returns true if product is successfully added to seller\'s inventory'
#
#   it 'is not valid without a name' do
#     valid_product.name = nil
#     expect(valid_product).to_not be_valid
#   end
#
#   it 'is not valid without a price' do
#     valid_product.price = nil
#     expect(valid_product).to_not be_valid
#   end
#
#   it 'is not valid without a description' do
#     valid_product.description = nil
#     expect(valid_product).to_not be_valid
#   end
#   it 'is not valid without a seller' do
#     valid_product.seller = nil
#     expect(valid_product).to_not be_valid
#   end
#
#   it 'belongs to a seller' do
#     expect(valid_product.seller.username).to eq "Batman"
#   end
#
#   it 'belongs to an inventory' do
#   expect(valid_product.inventory.seller.username).to eq "Batman"
# end
#
#   it 'has many cart products' do
#     valid_product.cart_products << [cart_product_1, cart_product_2]
#     expect(valid_product.cart_products.count).to eq(2)
#   end
#
#   it 'has many carts' do
#     valid_product.cart_products << [cart_product_1, cart_product_2]
#     expect(valid_product.carts.count).to eq(2)
#   end

end
