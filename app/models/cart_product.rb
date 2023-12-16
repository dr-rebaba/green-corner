class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, :price, presence: true
end
