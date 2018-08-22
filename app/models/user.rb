class User < ApplicationRecord
  has_one :cart
  has_many :cart_products, through: :cart
  has_many :products, through: :cart
  has_one :inventory, required: false, foreign_key: :seller_id
  has_secure_password
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  validates :email, :username, :first_name, :last_name, :credit_card_number, presence: true
  validates :credit_card_number, length: { is: 16 }

  def full_name
    "#{first_name} #{last_name}"
  end

end
