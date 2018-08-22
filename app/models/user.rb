class User < ApplicationRecord
  has_one :cart
  has_many :cart_products, through: :cart
  has_many :products, through: :cart
  has_one :inventory, required: false
  # has_secure_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
