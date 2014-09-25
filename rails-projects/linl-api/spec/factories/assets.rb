# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    user_id 1
    name "MyString"
    item_type "MyString"
    rate_of_return 1
    initial_amount_cents 1
    final_amount_cents 1
    start_date "2014-09-25 13:50:49"
    end_date "2014-09-25 13:50:49"
    user_owned ""
  end
end
