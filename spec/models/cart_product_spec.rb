require 'rails_helper'

RSpec.describe CartProduct, type: :model do

  let(:bman) { User.create(username: "Batman", first_name: "Bruce", last_name: "Wayne", credit_card_number: 101011110000, is_seller: true, email: "bman@wayne_industries.net", password: "not_password") }

  let(:bman_cart) { Cart.create(user: bman)}

  let(:bman_inventory) { Inventory.create(seller: bman) }
  #
  let(:valid_product) { Product.create(name: "candy", price: 11.00, description: "a sweet for the sweet", seller: bman, inventory: bman_inventory, quantity: 11) }

  let(:cart_product_1) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 2) }

  let(:cart_product_2) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 3) }

  it 'is valid with valid attributes' do
    expect(cart_product_1).to be_valid
  end

  it 'is not valid without a cart' do
    cart_product_1.cart_id = nil
    expect(cart_product_1).to_not be_valid
  end

  it 'is not valid without a product' do
    cart_product_1.product_id = nil
    expect(cart_product_1).to_not be_valid
  end

  it 'is not valid without a quantity' do
    cart_product_1.quantity = nil
    expect(cart_product_1).to_not be_valid
  end

  it 'belongs to a cart' do
    expect(cart_product_1.cart.id).to eq(1)
  end

  it 'belongs to a product' do
    expect(cart_product_2.product.id).to eq(1)
  end

end
