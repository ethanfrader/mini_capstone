class CategoryProduct < ApplicationRecord
  has_many :products
  has_many :categories
end
