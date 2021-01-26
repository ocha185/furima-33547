require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
      context '内容に問題がない場合' do
        it "必要な情報を適切に入力すると、商品の出品ができること" do
          expect(@item).to be_valid
        end
        it "価格は半角英数字のみ保存できる" do
          @item.price = "9999999"
          expect(@item).to be_valid
        end
      end
      context '内容に問題がある場合' do
        it "商品名が必須であること" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "商品の説明が必須であること" do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it "カテゴリーの情報が必須であること" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank")
        end
        it "商品の状態についての情報が必須であること" do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition is not a number", "Condition can't be blank")
        end
        it "配送料の負担についての情報が必須であること" do
          @item.charges_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Charges is not a number", "Charges can't be blank")
        end
        it "発送元の地域についての情報が必須であること" do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture is not a number", "Prefecture can't be blank")
        end
        it "発送までの必須うについての情報が必須であること" do
          @item.ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship is not a number", "Ship can't be blank")
        end
        it "priceが空だと登録できないこと" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "imageが空だと保存できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
  end