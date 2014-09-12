require 'faker'

FactoryGirl.define do
  factory :child do
    name { Faker::Name.name }
    birthdate { rand(100.year.ago..Time.now).to_datetime }
    expected_tuition_cents { rand(100000000) }

    factory :invalid_child do
      name { nil }
    end
  end
end
