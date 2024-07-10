FactoryBot.define do
  factory :po do
    post { '123-4567' }
    area_id {'4'}
    city {'大田区'}
    address {'馬場番地'}
    building {'建物'}
    tel {'12345567'}
  end
end
