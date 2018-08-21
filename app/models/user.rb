class User < ApplicationRecord
  has_one :cart
  has_many :products, through: :cart
end
