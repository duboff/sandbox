ActiveAdmin.register Partner do
  permit_params :id, :user_id, :name, :birthdate, :state, :ss_currently_collecting,
    :current_earnings_cents, :final_year_earnings_cents, :roth_first,
    :created_at, :updated_at
end
