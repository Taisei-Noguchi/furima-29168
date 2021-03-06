# README

# テーブル設計

usersテーブル

| Column     | Type    | Options      |
| ---------- | ------- | ------------ |
| nickname   | string  | null: false  |
| email      | string  | null: false  |
| password   | string  | null: false  |
| first_name | string  | null: false  |
| second_name| string  | null: false  |
| first_kana | string  | null: false  |
| second_kana| string  | null: false  |
| birthday   | date    | null: false  |

Association

- has_many :items
- has_one :order

itemsテーブル

| Column          | Type        | Options                       |
| --------------- | ----------- | ----------------------------- |
| name            | string      | null: false                   |
| detail          | text        | null: false                   |
| price           | string      | null: false                   |
| category_id     | integer     | null: false                   |
| condition_id    | integer     | null: false                   |
| delivery_fee_id | integer     | null: false                   |
| shipping_area_id| integer     | null: false                   |
| shipping_days_id| integer     | null: false                   |
| user            | references  | null: false, foreign_key:true |

Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash 

ordersテーブル

| Column          | Type         | Options                       |
| --------------- | ------------ | ----------------------------- |
| user            | references   | null: false, foreign_key:true |
| item            | references   | null: false, foreign_key:true |

Association

- has_one :street_address
- belongs_to :user
- belongs_to :item

addressesテーブル

| Column          | Type         | Options                       |
| --------------- | ------------ | ----------------------------- |
| postal_code     | string       | null: false                   |
| shipping_area_id| integer      | null: false                   |
| city            | string       | null: false                   |
| address_detail  | string       | null: false                   |
| apartment_name  | string       |                               |
| phone_number    | string       | null: false                   |
| order           | references   | null: false, foreign_key:true |

Association

- belongs_to :order
- belongs_to_active_hash




