class Item < ApplicationRecord
  belongs_to :user
  has_one :orders
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :price
  end

  validates :category_id, numericality: { other_than: 0, message: 'Select' }
  validates :condition_id, numericality: { other_than: 0, message: 'Select' }
  validates :shipping_fee_id, numericality: { other_than: 0, message: 'Select' }
  validates :shipping_place_id, numericality: { other_than: 0, message: 'Select' }
  validates :prep_time_id, numericality: { other_than: 0, message: 'Select' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
