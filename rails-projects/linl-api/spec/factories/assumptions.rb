# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assumption do
    name { Faker::Hacker.say_something_smart }
    item_type "special"
    current_percentage 0
    future_percentage 0
    monthly_cents 0
    start_date ''
    end_date ''
    user_owned { true }

    factory :special do
      item_type "special"
      monthly_cents { rand(10000000000)/12 }
    end

    factory :tax do
      item_type "tax"
      future_percentage { rand(50) }
    end

    factory :inflation do
      item_type "inflation"
      current_percentage { rand(50) }
      future_percentage { |u| rand(u.current_percentage + 50) }
    end

    factory :cut do
      item_type "cut"
      future_percentage { rand(100) }
    end
  end
end
