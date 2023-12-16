class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_one :cart, dependent: :destroy
  has_one :address

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :recycle_points
end
