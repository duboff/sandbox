class AssumptionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :item_type, :current_percentage,
    :future_percentage, :monthly_cents, :start_date, :end_date,
    :user_owned, :created_at, :updated_at
end
