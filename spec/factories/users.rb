FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email Faker::Internet
    password { Faker::Internet.password }
  end
end
