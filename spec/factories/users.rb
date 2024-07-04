FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a0a0a0'}
    password_confirmation {password}

  end
end