require 'rails_helper'

RSpec.describe StreetAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item,user_id: @user.id)
    @item.image = fixture_file_upload('public/output-image2.png')
    sleep(1)
    @street_address = FactoryBot.build(:street_address,user_id: @user.id,item_id: @item.id)
  end


  describe '商品購入機能' do
    context '購入がうまくいくとき' do
      it "postal_code, shipping_area, city, address_detail, phone_number, tokenが存在すれば登録できる" do
        expect(@street_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "郵便番号が空だと購入できない" do
        @street_address.postal_code = nil
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it "郵便番号に(-)が含まれていないと購入できない" do
        @street_address.postal_code = 1234567
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "都道府県を選択しないとが空だと購入できない" do
        @street_address.shipping_area = "1"
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it "市町村区が空だと購入できない" do
        @street_address.city = nil
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空だと購入できない" do
        @street_address.address_detail = nil
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Address detail can't be blank")
      end

      it "電話番号が空だと購入できない" do
        @street_address.phone_number = nil
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it "電話番号が半角数字でないと購入できない" do
        @street_address.phone_number = "１２３４５"
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号に(-)が含まれていると購入できない" do
        @street_address.phone_number = "-"
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が12桁以上だと購入できない" do
        @street_address.phone_number = "012044122222"
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Phone number is invalid"])
      end

      it "トークンが生成されないと購入できない" do
        @street_address.token = nil
        @street_address.valid?
        expect(@street_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end