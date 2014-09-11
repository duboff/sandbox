# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8, 30) }
    password_confirmation { |u| u.password }
=begin
    remember_token { Faker::Internet.password(8) }
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
      u.ss_monthly_benefit_cents { u.ss_currently_collecting ? rand(5000000)/12 : 0 }
    end
=end

  end
end
