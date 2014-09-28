class PartnerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :birthdate, :marital_status, 
    :state, :ss_currently_collecting, :current_earnings_cents, 
    :final_year_earnings_cents, :roth_first, :retirement_date,
    :created_at, :updated_at
end
