class AssetSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :item_type, :rate_of_return,
    :initial_amount_cents, :final_amount_cents, :user_owned,
    :start_date, :end_date, :created_at, :updated_at
end
