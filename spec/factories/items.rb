FactoryBot.define do
  factory :item do
    title               {'テレビ'}
    price               {'600'}
    delivery               {'商品説明'}
    association :user
    commodity_condition_id { 2 }
    shipping_charge_id { 2 }
    region_of_origin_id { 2 }
    days_to_ship_id { 2 }
    category_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
