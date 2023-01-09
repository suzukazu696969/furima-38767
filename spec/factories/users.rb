FactoryBot.define do
  factory :user do
    last_name               { '山田' }
    first_name              { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000sade' }
    password_confirmation { password }
    birth_date            { '2000/2/2' }
  end
end
