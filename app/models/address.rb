class Address < ApplicationRecord
  has_one :user
  has_one :recycle_point
end
