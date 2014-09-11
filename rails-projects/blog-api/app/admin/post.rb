ActiveAdmin.register Post do
  permit_params :id, :title, :body, :created_at, :updated_at
end
