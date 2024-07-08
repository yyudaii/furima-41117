FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    message {Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9999999) }
    user_id { Faker::Number }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    fee_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    delay_id { Faker::Number.between(from: 2, to: 4) }

    association :user
    association :area
    association :condition
    association :delay
    association :fee
  end
end
