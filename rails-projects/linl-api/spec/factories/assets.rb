# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    name { Faker::Company.name }
    item_type "reserve"
    rate_of_return 0
    initial_amount_cents 0
    final_amount_cents 0
    start_date ""
    end_date ""
    user_owned { true }

    factory :reserve do
      item_type "reserve"
      rate_of_return { rand(100) }
      initial_amount_cents { rand(100000000000) }
      final_amount_cents { |u| rand(u.initial_amount_cents + 10000000000) }
    end

    factory :regular do
      item_type "regular"
      rate_of_return { rand(100) }
      initial_amount_cents { rand(100000000000) }
    end

    factory :income do
      item_type "income"
      initial_amount_cents { rand(100000000000) }
    end
  end
end
