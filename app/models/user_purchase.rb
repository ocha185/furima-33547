class UserPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :phone_number, :user_id, :item_id, :building_name, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    buyer_history = BuyerHistory.create(user_id: user_id, item_id: item_id)
    ProductPurchaseFunction.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_history_id: buyer_history.id)
  end

end