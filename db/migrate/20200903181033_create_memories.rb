class CreateMemories < ActiveRecord::Migration[6.0]
  def change
    create_table :memories do |t|
      t.date :user_id
      t.date :item_id
      t.timestamps
    end
  end
end
