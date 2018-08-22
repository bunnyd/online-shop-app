require 'rails_helper'

RSpec.describe Product, type: :model do

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

  it 'is valid with valid attributes' do
    valid_product.image_url = "https://s3.amazonaws.com/spoonuniversi-wpengine/spoonuniversi/wp-content/uploads/2015/10/25811972-origpic-b564f6.jpg"
    expect(valid_product).to be_valid
  end

  it 'is valid without an image url' do
    expect(valid_product).to be_valid
  end

  it 'is not valid without a name' do
    valid_product.name = nil
    expect(valid_product).to_not be_valid
  end

  it 'is not valid without a price' do
    valid_product.price = nil
    expect(valid_product).to_not be_valid
  end

  it 'is not valid without a description' do
    valid_product.description = nil
    expect(valid_product).to_not be_valid
  end
  it 'is not valid without a seller' do
    valid_product.seller = nil
    expect(valid_product).to_not be_valid
  end

  it 'belongs to a seller' do
    expect(valid_product.seller.username).to eq "Batman"
  end

  it 'belongs to an inventory' do
  expect(valid_product.inventory.seller.username).to eq "Batman"
end

  it 'has many cart products' do
    valid_product.cart_products << [cart_product_1, cart_product_2]
    expect(valid_product.cart_products.count).to eq(2)
  end

  it 'has many carts' do
    valid_product.cart_products << [cart_product_1, cart_product_2]
    expect(valid_product.carts.count).to eq(2)
  end

end
