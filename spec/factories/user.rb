FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    sex { 1 }
    email {'example@example.com'}
    password {'123456'}
    adress
  end
end
