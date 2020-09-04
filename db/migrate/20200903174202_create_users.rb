class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :e_mail
      t.string :password
      t.string :first_name
      t.string :second_name
      t.string :first_kana
      t.string :second_kana
      t.datetime :birthday
      t.timestamps
    end
  end
end
