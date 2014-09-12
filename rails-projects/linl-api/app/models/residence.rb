class Residence < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  KINDS = %w[rent own]

=begin
  def self.kind_options
    KINDS.map{ |k| [k.titleize, k] }
  end

  def owned?
    kind == KINDS.last
  end

  def rental?
    kind == KINDS.first
  end
=end

end

