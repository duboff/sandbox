def seed_data
  puts 'Creating initial user set'
  FactoryGirl.create_list(:user, 10)
  puts 'Initial user set creation successful'
  puts 'Creating admin user'
  FactoryGirl.create(:user, email: "test@example.com", password: 'password', 
    password_confirmation: 'password')
  puts 'Admin user creation successful'
  puts 'Admin email = test@example.com'
  puts 'Admin password = password'
end
