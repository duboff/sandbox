class AddRothFirstToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :roth_first, :bool
  end
end
