require 'faker'

FactoryGirl.define do
  factory :partner do
    name { Faker::Name.name }
    birthdate { rand(100.year.ago..Time.now).to_datetime }
    marital_status { User::MARITAL_STATUSES.sample }
    state { User::STATES.keys.sample }
    ss_currently_collecting { [true, false].sample }
    current_earnings_cents  { rand(100000000) }
    final_year_earnings_cents { rand(100000000) }

    factory :invalid_partner do
      name { nil }
    end

    before(:create) do |u|
      u.ss_monthly_benefits_cents { u.ss_currently_collecting ? rand(5000000)/12 : 0 }
    end
  end
end
