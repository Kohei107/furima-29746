class Order < ApplicationRecord
  has_one :adress
  belongs_to :item
  belongs_to :user
end
