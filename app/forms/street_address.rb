class StreetAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area, :city, :address_detail, :apartment_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id
    validates :city
    validates :address_detail
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    order = Order.create!(user_id: user_id,item_id: item_id)
    StreetAddress.create!(postal_code: postal_code,shipping_area: shipping_area, city: city, address_detail: address_detail,apartment_name: apartment_name, phone_number: phone_number,order_id: order.id)
  end
end