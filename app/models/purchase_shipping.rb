class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :item_id, :user_id, :region_of_origin_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :region_of_origin_id, numericality: { other_than: 1 }
    validates :addresses
    validates :city
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_number,
              format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0-?\d{4}-?\d{4}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, region_of_origin_id: region_of_origin_id, city: city, addresses: addresses,
                    phone_number: phone_number, building: building, purchase_id: purchase.id)
  end
end
