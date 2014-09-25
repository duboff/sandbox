ActiveAdmin.register User do
  permit_params :id, :first_name, :last_name, :email, :password, :password_confirmation, 
    :birthdate, :marital_status, :state, :current_earnings_cents,
    :final_year_earnings_cents, :ss_currently_collecting, :roth_first, 
    :created_at, :updated_at
end
