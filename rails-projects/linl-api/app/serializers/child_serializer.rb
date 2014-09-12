class ChildSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :birthdate, :expected_tuition_cents, :created_at, :updated_at
end
