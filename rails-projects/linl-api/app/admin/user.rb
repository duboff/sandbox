ActiveAdmin.register User do
  permit_params :id, :first_name, :last_name, :email, :created_at, :updated_at
end
