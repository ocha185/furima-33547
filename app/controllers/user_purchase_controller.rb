class UserPurchaseController < ApplicationController
  before_action :move_to_signed_in

  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
    if @item.buyer_history.present? || current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:user_purchase).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end
end
