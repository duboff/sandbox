# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assumption do
    user_id 1
    name "MyString"
    item_type "MyString"
    current_percentage 1
    future_percentage 1
    monthly_cents 1
    start_date "2014-09-25 13:51:29"
    end_date "2014-09-25 13:51:29"
    user_owned ""
  end
end
