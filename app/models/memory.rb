class Memory < ApplicationRecord
  has_many :streetaddresss
  belongs_to :item
end
