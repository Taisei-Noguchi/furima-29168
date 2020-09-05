class Item < ApplicationRecord
  has_many :memorys
  belongs_to :user
end
