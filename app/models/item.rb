class Item < ApplicationRecord
  

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  
  #validates :neme, presence: true
  #validates :detail, presence: true
  #validates :category, presence: true
  #validates :condition, presence: true
  #validates :shipping_cost, presence: true
  #validates :shipping_place, presence: true
  #validates :prep_time, presence: true
  #validates :price, :presence: true
end
