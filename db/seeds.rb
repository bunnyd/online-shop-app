# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Cart.destroy_all
Product.destroy_all
Inventory.destroy_all
Transaction.destroy_all

user1 = User.create(username: "Username", password: "Password", first_name: "First", last_name: "Last", credit_card_number: "31241581412", is_buyer: true, is_seller: false)
user2 = User.create(username: "Username2", password: "Password", first_name: "Second", last_name: "Last", credit_card_number: "3234581412", is_buyer: true, is_seller: true)
user3 = User.create(username: "Username3", password: "Password", first_name: "Third", last_name: "Last", credit_card_number: "3234581412", is_buyer: false, is_seller: true)

user1_cart = Cart.create(user: user1)
user2_cart = Cart.create(user: user2)
user3_cart = Cart.create(user: user3)

# chocolate_bar = Product.create(name: "chocolate bar", price: 4.50, cart: user1_cart, description: "delicious")
# book = Product.create(name: "book", price: 14.50, cart: user2_cart, description: "bestselling thriller")
# computer = Product.create(name: "computer", price: 1450.00, cart: user2_cart, description: "for the future programmer")
