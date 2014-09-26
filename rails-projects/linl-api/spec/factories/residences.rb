require 'faker'

FactoryGirl.define do
  factory :residence do
    name { Faker::Name.name }
    monthly_payment_cents { rand(400000) }
    current_value_cents { rand(10000000) }
    mortgage_balance_cents { rand(10000000) }
    years_remaining { [30, 15, 10, 5].sample }
    misc_annual_expenses_cents { rand(10000000) }
    utilities_cents { rand(100000) }
    annual_insurance_cents { rand(10000000) }
    annual_property_tax_cents { rand(10000000) }
    owned { [true, false].sample }

    factory :invalid_residence do
    end
  end
end
