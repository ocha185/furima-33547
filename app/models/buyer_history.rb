class BuyerHistory < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :product_purchase_function
end
