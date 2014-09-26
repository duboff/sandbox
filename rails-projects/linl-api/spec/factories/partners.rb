require 'faker'

FactoryGirl.define do
  factory :partner do
    name { Faker::Name.name }
    birthdate { rand(100.year.ago..Time.now).to_datetime }
    state { User::STATES.keys.sample }
    marital_status { [true, false].sample }
    ss_currently_collecting { [true, false].sample }
    current_earnings_cents  { rand(100000000) }
    final_year_earnings_cents { rand(100000000) }
    roth_first { [true, false].sample }

    factory :invalid_partner do
      name { nil }
    end

    after(:create) do |u|
      assets = [:regular, :reserve, :income]
      assumptions = [:special, :tax, :inflation, :cut]
      retirements = [:pension, :roth, :ira, :ss]

      rand(10).times do
        FactoryGirl.create(assets.sample, user_id: u.id, user_owned: false)
      end
      rand(3).times do
        FactoryGirl.create(assumptions.sample, user_id: u.id, user_owned: false)
      end
      rand(6).times do
        FactoryGirl.create(retirements.sample, user_id: u.id, user_owned: false)
      end
    end
  end
end
