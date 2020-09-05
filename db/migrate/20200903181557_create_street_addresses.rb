class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string :postal_code
      t.string :prefectures
      t.string :city
      t.string :address_detail
      t.string :apartment_name
      t.string :room_number
      t.string :phone_number
      t.date :memory_id
      t.timestamps
    end
  end
end
