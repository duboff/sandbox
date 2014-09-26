require 'faker'

FactoryGirl.define do
  factory :child do
    name { Faker::Name.name }
    birthdate { rand(100.year.ago..Time.now).to_datetime }
    expected_tuition_cents { rand(100000000) }
    college_entry_date { |u| u.birthdate + 18.years }
    college_exit_date { |u| u.college_entry_date + 4.years }

    factory :invalid_child do
    end
  end
end
