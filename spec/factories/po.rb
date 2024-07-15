FactoryBot.define do
  factory :po do
    token {"tok_abcdefghijk00000000000000000"}
    post { '123-4567' }
    area_id {'4'}
    city {'大田区'}
    address {'馬場番地'}
    building {'建物'}
    tel {'1234556789'}
  end
end
