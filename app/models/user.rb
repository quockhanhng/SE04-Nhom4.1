class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :products

  validates :email, presence: true
  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true

  enum role: [:admin, :buyer, :seller]

  def cart_active
    carts.where(status: "active").first
  end
end
