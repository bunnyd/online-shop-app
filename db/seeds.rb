# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CartProduct.destroy_all
Cart.destroy_all
Product.destroy_all
Inventory.destroy_all
User.destroy_all

buyer1 = User.create(username: "Username", password: "Password", email: "email1@1.com", first_name: "First", last_name: "Last", credit_card_number: "31241581412", is_seller: false)
seller2 = User.create(username: "Username2", password: "Password", email: "email2@2.com", first_name: "Second", last_name: "Last", credit_card_number: "3234581412", is_seller: true)
seller3 = User.create(username: "Username3", password: "Password", email: "email3@3.com", first_name: "Third", last_name: "Last", credit_card_number: "3234581412",  is_seller: true)

buyer1_cart = Cart.create(user: buyer1)
seller2_cart = Cart.create(user: seller2)
seller3_cart = Cart.create(user: seller3)

seller2_inventory = Inventory.create(seller: seller2)
seller3_inventory = Inventory.create(seller: seller3)

chocolate_bar_by_seller3 = Product.create(name: "chocolate bar", price: 4.50, description: "delicious", seller: seller3, inventory: seller3_inventory, quantity: 2, image_url: 'https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fs.eatthis-cdn.com%2Fmedia%2Fimages%2Fext%2F133336383%2Fchocolate-for-sex-drive.jpg&f=1')
chocolate_bar_by_seller2 = Product.create(name: "chocolate bar", price: 4.50, description: "delicious", seller: seller2, inventory: seller2_inventory, quantity: 3, image_url: 'https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fs.eatthis-cdn.com%2Fmedia%2Fimages%2Fext%2F133336383%2Fchocolate-for-sex-drive.jpg&f=1')

book_by_seller2 = Product.create(name: "book", price: 14.50, description: "bestselling thriller", seller: seller2, inventory: seller2_inventory, quantity: 1)
book_by_seller3 = Product.create(name: "book", price: 14.50, description: "bestselling thriller", seller: seller3, inventory: seller3_inventory, quantity: 5)

computer_by_seller2 = Product.create(name: "computer", price: 1450.00, description: "for the future programmer", seller: seller2, inventory: seller2_inventory, quantity: 5, image_url: 'https://proxy.duckduckgo.com/iur/?f=1&image_host=http%3A%2F%2Flerablog.org%2Fwp-content%2Fuploads%2F2013%2F06%2Fmacbook-pro.jpg&u=https://lerablog.org/wp-content/uploads/2013/06/macbook-pro.jpg')
computer_by_seller3 = Product.create(name: "computer", price: 1450.00, description: "for the future programmer", seller: seller3, inventory: seller3_inventory, quantity: 3, image_url: 'https://proxy.duckduckgo.com/iur/?f=1&image_host=http%3A%2F%2Flerablog.org%2Fwp-content%2Fuploads%2F2013%2F06%2Fmacbook-pro.jpg&u=https://lerablog.org/wp-content/uploads/2013/06/macbook-pro.jpg')

buyer1_buys_1_computer_from_seller2 = CartProduct.create(cart: buyer1_cart, product: computer_by_seller2, quantity: 1)

buyer1_buys_11_books_from_seller3 = CartProduct.create(cart: buyer1_cart, product: book_by_seller2, quantity: 11)

seller2_buys_1_chocolate_bar_from_seller3 = CartProduct.create(cart: seller2_cart, product: chocolate_bar_by_seller3, quantity: 1)
