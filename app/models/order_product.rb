class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, :price, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
