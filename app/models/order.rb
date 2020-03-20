class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  belongs_to :product, through: :carted_products
end
