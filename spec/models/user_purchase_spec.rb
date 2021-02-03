require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '#create' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end
    context '内容に問題がない場合' do
      it "建物名は空でも登録できること" do
        @user_purchase.building_name = nil
        expect(@user_purchase).to be_valid
      end
    end
    context "内容に問題がある場合" do
      it "郵便番号が空では登録できないこと" do
        @user_purchase.post_code = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号が数字のみだと登録できないこと" do
        @user_purchase.post_code = '12345678'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Post code is invalid")
      end
      it "都道府県が空では登録できないこと" do
        @user_purchase.prefecture_id = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Prefecture is not a number', "Prefecture can't be blank")
      end
      it "都道府県は１以外でないと登録できないこと" do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it "市区町村が空だと登録できないこと" do
        @user_purchase.city = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと登録できない事" do
        @user_purchase.address = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では登録できないこと" do
        @user_purchase.phone_number = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号にハイフンが不要で、11桁以内でないと登録できないこと" do
        @user_purchase.phone_number = '090-3345-8876'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @user_purchase.token = nil
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
