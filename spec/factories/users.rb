FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name                  {'自由'}
    myouji                {'男'}
    name_kana             {'フリー'}
    myouji_kana           {'マン'}
    birthday              {'2000-09-08'}
  end
end