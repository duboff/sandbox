require 'faker'

FactoryGirl.define do
  factory :user do |u|
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8, 30) }
    password_confirmation { |u| u.password }
    birthdate { rand(100.year.ago..Time.now).to_datetime }
    state { User::STATES.keys.sample }
    ss_currently_collecting { [true, false].sample }
    marital_status { [true, false].sample }
    current_earnings_cents  { rand(100000000) }
    final_year_earnings_cents { rand(100000000) }
    retirement_date { |u| rand((u.birthdate+40.years)..(u.birthdate+80.years)) }
    

    factory :invalid_user do
      email { nil }
    end

    after(:create) do |u|
      assets = [:regular, :reserve, :income]
      assumptions = [:special, :tax, :inflation, :cut]
      retirements = [:pension, :roth, :ira, :ss]

      FactoryGirl.create(:partner, user_id: u.id)
      rand(2).times do 
        FactoryGirl.create(:residence, user_id: u.id)
      end
      rand(3).times do 
        FactoryGirl.create(:child, user_id: u.id)
      end
      rand(10).times do
        FactoryGirl.create(assets.sample, user_id: u.id)
      end
      rand(3).times do
        FactoryGirl.create(assumptions.sample, user_id: u.id)
      end
      rand(6).times do
        FactoryGirl.create(retirements.sample, user_id: u.id)
      end
    end
  end
end
