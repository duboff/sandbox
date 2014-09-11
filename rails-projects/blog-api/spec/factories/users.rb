# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { |u| u.password }

    after(:create) do |u|
      rand(10).times do 
        FactoryGirl.create(:post, user_id: u.id)
      end
    end
  end
end
