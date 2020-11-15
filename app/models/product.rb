class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :cart_items

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 1}
  validates :status, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader

  enum status: [:in_stock, :out_of_stock].freeze

  def find_name_category
    category.name
  end
end
