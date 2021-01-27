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
          @item.category = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number", "Category can't be blank")
        end
        it "商品の状態についての情報が必須であること" do
          @item.condition = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition is not a number", "Condition can't be blank")
        end
        it "配送料の負担についての情報が必須であること" do
          @item.charge = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge is not a number", "Charge can't be blank")
        end
        it "発送元の地域についての情報が必須であること" do
          @item.prefecture = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture is not a number", "Prefecture can't be blank")
        end
        it "発送までの必須うについての情報が必須であること" do
          @item.ship = nil
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
        it "商品の状態は１以外でないと登録できないこと" do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition must be other than 1")
        end
        it "配送料の負担は１以外でないと登録できないこと" do
          @item.charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge must be other than 1")
        end
        it "発送元の地域は１以外でないと登録できないこと" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end
        it "発送までの日数は１以外でないと登録できないこと" do
          @item.ship_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship must be other than 1")
        end
        it "カテゴリーは１以外でないと登録できないこと" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end
        it "priceは全角文字では登録できないこと" do
          @item.price = "３００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it "priceは半角英数混合では登録できないこと" do
          @item.price = "3aa0"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it "priceは299円以下では登録できないこと" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it "priceは10,000,000以上では登録できないこと" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      end
    end
  end