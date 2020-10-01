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

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_place_id
    validates :prep_time_id
  end
  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

end