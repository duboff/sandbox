require 'faker'

FactoryGirl.define do
  factory :user do |u|
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8, 30) }
    password_confirmation { |u| u.password }
    birthdate { rand(100.year.ago..Time.now).to_datetime }
    marital_status { User::MARITAL_STATUSES.sample }
    state { User::STATES.keys.sample }
    ss_currently_collecting { [true, false].sample }
    current_earnings_cents  { rand(100000000) }
    final_year_earnings_cents { rand(100000000) }

    factory :invalid_user do
      email { nil }
    end

    before(:create) do |u|
      u.ss_monthly_benefits_cents { u.ss_currently_collecting ? rand(5000000)/12 : 0 }
    end

    after(:create) do |u|
        FactoryGirl.create(:partner, user_id: u.id)
        rand(2).times do 
          FactoryGirl.create(:residence, user_id: u.id)
        end
      rand(3).times do 
        FactoryGirl.create(:child, user_id: u.id)
      end
    end
  end
end
