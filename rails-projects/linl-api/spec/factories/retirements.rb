# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :retirement do
    user_id 1
    name "MyString"
    item_type "MyString"
    monthly_cents 1
    total_amount_cents 1
    contributions_cents 1
    employer_contributions_cents 1
    start_date "2014-09-25 13:50:05"
    end_date "2014-09-25 13:50:05"
    user_owned ""
  end
end
