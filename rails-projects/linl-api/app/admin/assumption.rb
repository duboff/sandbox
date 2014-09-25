ActiveAdmin.register Assumption do
  permit_params :id, :user_id, :name, :item_type, :current_percentage,
    :future_percentage, :monthly_cents, :start_date, :end_date, :user_owned
end
