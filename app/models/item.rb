class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :ship_id
  end

  with_options presence: true do
    validates :name
    validates :description
    validates :category
    validates :condition
    validates :charge
    validates :prefecture
    validates :ship
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  has_one_attached :image
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :ship
  has_one :buyer_history
end
