class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :amount, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :price, presence: true
  validates :delivery_fee, presence: true
  # validate :validate_quantity
  #
  # def validate_quantity
  #   errors.add(:quantity, "Out of stock") if quantity > product.quantity
  # end
  #

  def amount_calc
    quantity * price
  end
end
