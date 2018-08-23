require 'rails_helper'

RSpec.describe User, type: :model do

  let(:bman) { User.create(username: "Batman", first_name: "Bruce", last_name: "Wayne", credit_card_number: 101011110000, is_seller: true, email: "bman@wayne_industries.net", password: "not_password") }


  let(:not_bman) { User.create(username: "Not Batman", first_name: "Not Bruce", last_name: "Not Wayne", credit_card_number: 101011110000, is_seller: true, email: "not_bman@wayne_industries.net", password: "password") }

  let(:bman_inventory) { Inventory.create(seller:  bman) }

  let(:valid_product) { Product.create(name: "candy", price: 11.00, description: "a sweet for the sweet", seller: bman, inventory: bman_inventory)
  }

  let(:bman_cart) { Cart.create(user: bman) }

  let(:not_bman_cart) { Cart.create(user: bman) }

  let(:cart_product_1) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 2) }

  let(:cart_product_2) { CartProduct.create(cart: bman_cart, product: valid_product, quantity: 3) }

  let(:cart_product_3) { CartProduct.create(cart: not_bman_cart, product: valid_product, quantity: 3) }

  it 'is not valid without a username' do
    valid_user.username = nil
    expect(valid_user.username).to_not be_valid
  end

  it 'is not valid without a password' do
    valid_user.password = nil
    expect(valid_user.password).to_not be_valid
  end

  it 'is not valid without a email' do
    valid_user.email = nil
    expect(valid_user.email).to_not be_valid
  end

  it 'is not valid without a first_name' do
    valid_user.first_name = nil
    expect(valid_user.first_name).to_not be_valid
  end

  it 'is not valid without a last_name' do
    valid_user.last_name = nil
    expect(valid_user.last_name).to_not be_valid
  end

  it 'is not valid without a credit_card_number' do
    valid_user.credit_card_number = nil
    expect(valid_user.credit_card_number).to_not be_valid
  end

  it 'is valid with 16 digits for credit_card_number' do
    valid_user.credit_card_number.length = 16
    expect(valid_user.credit_card_number).to be_valid
  end

  it 'is not valid without a cart' do
    valid_user.cart = nil
    expect(valid_user.cart).to_not be_valid
  end
end
