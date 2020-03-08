class Product < ApplicationRecord
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
