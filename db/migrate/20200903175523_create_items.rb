class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.string :category_id
      t.string :condition
      t.string :delivery_fee_id
      t.string :shipping_area_id
      t.string :shipping_days_id
      t.date :user_id
      t.timestamps
    end
  end
end
