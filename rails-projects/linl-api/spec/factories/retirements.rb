require 'faker'

FactoryGirl.define do
  factory :retirement do
    name { Faker::Company.name }
    monthly_cents 0
    total_amount_cents 0
    contributions_cents 0
    employer_contributions_cents 0
    start_date ""
    end_date ""
    user_owned { true }

    factory :pension do
      item_type "pension"
      monthly_cents { rand(1000000000)/12 }
    end

    factory :roth do
      item_type "roth"
      contributions_cents { rand(1000000000) }
      employer_contributions_cents { rand(1000000000) }
      total_amount_cents { rand(1000000000) }
    end

    factory :ira do
      item_type "ira"
      contributions_cents { rand(1000000000) }
      total_amount_cents { rand(1000000000) }
    end

    factory :ss do
      item_type "ss"
      monthly_cents { rand(10000000)/12 }
    end
  end
end
