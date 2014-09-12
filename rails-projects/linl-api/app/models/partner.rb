class Partner < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true, uniqueness: true
  validates :name, presence: true
end
