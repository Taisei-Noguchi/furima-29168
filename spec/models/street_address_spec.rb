require 'rails_helper'

RSpec.describe StreetAddress, type: :model do
  @user = FactoryBot.create(:user)
  @item = FactoryBot.create(:item,user_id: @user.id)
  @street_address = FactoryBot.build(:street_address,user_id: @user.id,item_id: @item.id)
end
