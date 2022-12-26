class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :category, :commodity_condition, :shipping_charge, :region_of_origin, :days_to_ship
  has_one_attached :image
  belongs_to :user
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
  validates :title, presence: true
  validates :delivery, presence: true
  validates :user, presence: true
  validates :commodity_condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :region_of_origin_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 }  
end
