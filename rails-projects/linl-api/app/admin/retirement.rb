ActiveAdmin.register Retirement do
  permit_params :id, :user_id, :name, :item_type, :monthly_cents, :total_amount_cents,
    :contributions_cents, :employer_contributions_cents, :start_date, :end_date,
    :user_owned
end
