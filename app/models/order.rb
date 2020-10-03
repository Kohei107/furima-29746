class Order < ApplicationRecord
  has_one :adress
  belongs_to :item
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_place

  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :street_number, :building, :phone_number

  validates :token, presence: true
end
