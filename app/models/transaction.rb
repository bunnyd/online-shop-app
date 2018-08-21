class Transaction < ApplicationRecord
  belongs_to :user, as: :buyer
    foreign_key :buyer_id
    class: :User

  belongs_to :user, as: :seller
    foreign_key :seller_id
    class: :User

end
