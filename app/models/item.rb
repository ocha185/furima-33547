class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :charges_id, numericality: { other_than: 1 } 
  validates :ship_id, numericality: { other_than: 1 } 

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :charges_id
    validates :prefecture_id
    validates :ship_id
    validates :price, numericality:{only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
    validates :image
  end

  has_one_attached :image
  belongs_to :user, optional: true
end
