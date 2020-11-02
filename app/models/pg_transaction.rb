class PgTransaction < ApplicationRecord
  belongs_to :cart

  validates :charge_id, presence: true
  validates :charge_amount, presence: true
  validates :total_delivery_fee, presence: true
  validates :payment_type, presence: true

  enum payment_type: [:wait_payment, :paid, :transfer_success, :shipping, :shipped, :done, :cancel].freeze
end
