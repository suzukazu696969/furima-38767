FactoryBot.define do
  factory :purchase_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '188-3000' }
    region_of_origin_id { 2 }
    city { '横浜' }
    addresses          { '4-4' }
    phone_number       { '09012341234' }
  end
end
