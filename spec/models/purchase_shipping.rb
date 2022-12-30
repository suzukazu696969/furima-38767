class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :region_of_origin_id, :city, :addresses, :building, :phone_number, :purchase, 
end