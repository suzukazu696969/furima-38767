class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :commodity_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :region_of_origin
  belongs_to_active_hash :days_to_ship
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :title, presence: true
  validates :image, presence: true
  validates :delivery, presence: true

  validates :commodity_condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :region_of_origin_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
end
