ActiveAdmin.register User do
  permit_params :id, :first_name, :last_name, :email, :password, :password_confirmation, 
    :birthdate, :marital_status, :state, :ss_currently_collecting, :ss_monthly_benefits_cents,
    :current_earnings_cents, :final_year_earnings_cents, :created_at, :updated_at
end
