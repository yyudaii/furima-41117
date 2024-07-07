FactoryBot.define do
  factory :item do
    user_id{'3'}
    name{'フリーマン'}
    message{'テスト用なんだから何でもいいだろ。別にさ'}
    price{'10000'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
