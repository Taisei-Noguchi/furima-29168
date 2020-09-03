# README

# テーブル設計

usersテーブル

| Column     | Type   | Options                      |
| ---------- | ------ | ---------------------------- |
| nickname   | string | null: false                  |
| e_mail     | string | null: false                  |
| password   | string | null: false                  |
| first_name | string | null: false                  |
| second_name| string | null: false                  |
| first_kana | string | null: false                  |
| second_kana| string | null: false                  |
| birthday   | date   | null: false, foreign_key:true|

Association

- has_many :item
- has_one :streetaddress

itemsテーブル

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| name            | string | null: false                   |
| price           | string | null: false                   |
| category_id     | string | null: false                   |
| condition       | string | null: false                   |
| delivery_fee_id | string | null: false                   |
| shipping_area_id| string | null: false                   |
| shipping_days_id| string | null: false                   |
| user_id         | date   | null: false, foreign_key:true |

Association

- has_many :memory
- belongs_to :user

memorysテーブル

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| user_id         | date   | null: false, foreign_key:true |
| item-id         | date   | null: false, foreign_key:true |

Association

- has_many :streetaddress
- belongs_to :item

street_addresssテーブル

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| postal_code     | string | null: false                   |
| prefectures     | string | null: false                   |
| city            | string | null: false                   |
| address_detail  | string | null: false                   |
| apartment_name  | string | null: false                   |
| room_number     | string | null: false                   |
| phone_number    | string | null: false                   |
| memory_id       | date   | null: false, foreign_key:true |

Association

- belongs_to :user
- belongs_to :memory



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
