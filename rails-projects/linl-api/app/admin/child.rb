ActiveAdmin.register Child do
  permit_params :id, :user_id, :name, :birthdate, :expected_tuition_cents, :created_at, :updated_at
end
