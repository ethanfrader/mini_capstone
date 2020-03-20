class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_decimal: true, greater_than: 0 }
  validates :description, length: { in: 10..500 }

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  has_many :category_products
  has_many :categories, through: :category_products
  has_many :images

  has_many :carted_products
  has_many :orders, through: :carted_products
  belongs_to :user

  def is_discounted?
    discount = false
    if price < 6
      discount = true
    end
    discount
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    price + tax
  end
end
