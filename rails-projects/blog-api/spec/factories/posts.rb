# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    user_id 1
    title { Faker::Name.title }
    body { Faker::Lorem.paragraph }
  end
end
