# require 'rails_helper'
#
# RSpec.describe Inventory, type: :model do
#
#   let(:bman) { User.create(username: "Batman", first_name: "Bruce", last_name: "Wayne", credit_card_number: 101011110000, is_seller: true, email: "bman@wayne_industries.net", password: "not_password") }
#
#
#   let(:not_bman) { User.create(username: "Not Batman", first_name: "Not Bruce", last_name: "Not Wayne", credit_card_number: 101011110000, is_seller: true, email: "not_bman@wayne_industries.net", password: "password") }
#
#   let(:bman_inventory) { Inventory.create(seller: bman) }
#
#   let(:valid_product) { Product.create(name: "candy", price: 11.00, description: "a sweet for the sweet", seller: bman, inventory: bman_inventory, quantity: 11) }
#
#   let(:valid_product_2) { Product.create(name: "junk food", price: 1.00, description: "cheap junk food", seller: bman, inventory: bman_inventory, quantity: 100)
#   }
#
#   let(:bman_cart) { Cart.create(user: bman) }
#
#   let(:not_bman_cart) { Cart.create(user: bman) }
#
#   let(:cart_product_1) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 2) }
#
#   let(:cart_product_2) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 3) }
#
#   let(:cart_product_3) { CartProduct.create(cart: not_bman_cart, product: valid_product, quantity: 3) }
#
#   before do
#     bman_inventory.products << [valid_product, valid_product_2]
#   end
#
#   it 'is valid with valid attributes' do
#     expect(bman_inventory).to be_valid
#   end
#
#   it 'is invalid without a seller' do
#     bman_inventory.seller = nil
#     expect(bman_inventory).to_not be_valid
#   end
#
#   it 'has many distinct products' do
#     expect(bman_inventory.products.count).to eq(2)
#   end
#
#   context '#product available' do
#     it 'accepts a product name and returns if the item is available' do
#       evaluated = bman_inventory.product_available(valid_product.name)
#       expect(evaluated).to eq(true)
#     end
#   end
#
#   context '#verify_quantity' do
#     it '#verify_quantity accepts a product name and returns how many of that item is in the seller\'s inventory' do
#       verified_quantity = bman_inventory.verify_quantity("candy")
#       expect(verified_quantity).to eq(11)
#     end
#   end
#
#   context '#decrease_quantity'do
#     it 'takes a product name and a quantity, and returns true if item quantity in seller\'s inventory has decreased' do
#       initial_quantity = bman_inventory.verify_quantity("candy")
#       value = bman_inventory.decrease_quantity("candy", 1)
#       final_quantity = initial_quantity - 1
#       expect(value).to eq(true)
#       expect(final_quantity).to be(10)
#     end
#   end
#
#   context '#increase_quantity' do
#     it '#increase_quantity takes a product name and a quantity, and returns true if item quantity in seller\'s inventory has increased' do
#       initial_quantity = bman_inventory.verify_quantity("candy")
#       value = bman_inventory.increase_quantity("candy", 3)
#       final_quantity = initial_quantity + 3
#       expect(value).to eq(true)
#       expect(final_quantity).to eq(14)
#     end
#   end
#
#   context '#add_product' do
#     it '#add_product takes a hash of information for a product, creates a product, and returns true if product is successfully added to seller\'s inventory' do
#       new_product = bman_inventory.add_product(name: "frozen burrito", price: 1.50, description: "a college staple", seller: bman, inventory: bman_inventory, quantity: 3)
#       expect(new_product).to be(true)
#     end
#   end
#
#   context '::most_commonly_stocked_product' do
#     it '::most_commonly_stocked_product returns the most commonly stocked product' do
#       result = Inventory.most_commonly_stocked_product
#       expect(result).to eq("junk food")
#     end
#   end
#
# end
