ActiveAdmin.register Asset do
  permit_params :id, :user_id, :name, :item_type, :rate_of_return, :initial_amount_cents, 
    :final_amount_cents, :start_date, :end_date, :user_owned
end
