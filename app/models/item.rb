class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :memories
  belongs_to :user

  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_days_id, presence: true, numericality: { other_than: 1 }
end
