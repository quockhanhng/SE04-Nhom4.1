class Cart < ApplicationRecord
  belongs_to :user
  has_many :pg_transactions
  has_many :cart_items

  enum status: [:active, :done].freeze

  def total_amount
    cart_items.sum(:amount)
  end

  def total_delivery_fee
    cart_items.map { |cart_item| cart_item.delivery_fee }.sum
  end
end
