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

buyer1 = User.create(username: "EDengeres", password: "Password", email: "ellen@ellen.com", first_name: "Ellen", last_name: "Degeneres", credit_card_number: "3124158141212938", is_seller: false, image_url: "https://blogs.baruch.cuny.edu/com1010fall2013/files/2013/09/44985120.jpg")
seller2 = User.create(username: "NCage", password: "Password", email: "nicolas@nicolas.com", first_name: "Nicolas", last_name: "Cage", credit_card_number: "3124158141212938", is_seller: true, image_url: "https://i.kym-cdn.com/entries/icons/original/000/006/993/nickcage.jpg")
seller3 = User.create(username: "GClooney", password: "Password", email: "george@george.com", first_name: "George", last_name: "Clooney", credit_card_number: "3124158141212938",  is_seller: true, image_url: "https://amp.businessinsider.com/images/5b7d8ded64dce8bc068b4c03-750-563.jpg")
buyer4 = User.create(username: "Beyonce", password: "Password", email: "beyonce@beyonce.com", first_name: "Beyonce", last_name: "Knowles", credit_card_number: "3124158141212938", is_seller: false, image_url: "https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/beyonce-hero-487073444_copy.jpg")

buyer1_cart = Cart.create(user: buyer1)
seller2_cart = Cart.create(user: seller2)
seller3_cart = Cart.create(user: seller3)

seller2_inventory = Inventory.create(seller: seller2)
seller3_inventory = Inventory.create(seller: seller3)

chocolate_bar_by_seller3 = Product.create(name: "chocolate bar", price: 4.50, description: "delicious", seller: seller3, inventory: seller3_inventory, quantity: 2, image_url: 'https://proxy.duckduckgo.com/iu/?u=http%3A%2F%2Fs.eatthis-cdn.com%2Fmedia%2Fimages%2Fext%2F133336383%2Fchocolate-for-sex-drive.jpg&f=1')
chocolate_bar_by_seller2 = Product.create(name: "Hip Shoes", price: 80.00, description: "Awesome shoes", seller: seller2, inventory: seller2_inventory, quantity: 3, image_url: 'https://sep.yimg.com/ay/exotichighheels/clown-05-men-s-cartoon-costume-bump-toe-clown-shoe-18.gif')

book_by_seller2 = Product.create(name: "Book", price: 14.50, description: "bestselling thriller", seller: seller2, inventory: seller2_inventory, quantity: 1, image_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/d/d5/HowToReadABook.jpg/220px-HowToReadABook.jpg')
book_by_seller3 = Product.create(name: "Awesome Book", price: 14.50, description: "bestselling thriller", seller: seller3, inventory: seller3_inventory, quantity: 5, image_url: 'http://bizprog.com/wp-content/uploads/2015/06/leather-book-preview.png')
book_by_seller2 = Product.create(name: "car", price: 5000, description: "Tesla", seller: seller2, inventory: seller2_inventory, quantity: 1)

computer_by_seller2 = Product.create(name: "Fantastic Computer", price: 1450.00, description: "for the future programmer", seller: seller2, inventory: seller2_inventory, quantity: 5, image_url: 'https://4.imimg.com/data4/RQ/PS/MY-25091456/how-to-donate-computer-1-500x500.jpg')
computer_by_seller3 = Product.create(name: "Slow Computer", price: 1450.00, description: "for the future programmer", seller: seller3, inventory: seller3_inventory, quantity: 3, image_url: 'https://proxy.duckduckgo.com/iur/?f=1&image_host=http%3A%2F%2Flerablog.org%2Fwp-content%2Fuploads%2F2013%2F06%2Fmacbook-pro.jpg&u=https://lerablog.org/wp-content/uploads/2013/06/macbook-pro.jpg')

tesla_by_seller3 = Product.create(name: "Tesla Model S", price: 5000, description: "Fast car", seller: seller3, inventory: seller3_inventory, quantity: 2, image_url: 'https://www.tesla.com/sites/default/files/images/software_update.jpg')

buyer1_buys_1_computer_from_seller2 = CartProduct.create(cart: buyer1_cart, product: computer_by_seller2, quantity: 1)

buyer1_buys_11_books_from_seller3 = CartProduct.create(cart: buyer1_cart, product: book_by_seller2, quantity: 11)

seller2_buys_1_chocolate_bar_from_seller3 = CartProduct.create(cart: seller2_cart, product: chocolate_bar_by_seller3, quantity: 1)
