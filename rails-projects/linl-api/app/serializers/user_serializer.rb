class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, 
    :birthdate, :marital_status, :state, :ss_currently_collecting,
    :password, :password_confirmation, :authentication_token, :roth_first,
    :current_earnings_cents, :final_year_earnings_cents, :retirement_date,
    :created_at, :updated_at
end
