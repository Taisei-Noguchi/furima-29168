require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it "image,name,detail,price,category_id,condition_id,delivery_fee_id,shipping_area_id,shipping_days_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it "画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が空だと登録できない" do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      
      it "カテゴリーを選択しないと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品状態を選択しないと登録できない" do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料の負担を選択しないと登録できない" do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it "発送元の地域を選択しないと登録できない" do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it "発送までの日数を選択しないと登録できない" do
        @item.shipping_days_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
      end

      it "価格が空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end

      it "価格が¥300以上でないと登録できない" do
        @item.price = "10"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it "価格が¥9999999以下でないと登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end

      it "価格が半角数字でないと登録できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
      end
    end
  end
end
