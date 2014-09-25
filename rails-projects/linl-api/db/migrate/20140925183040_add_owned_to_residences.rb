class AddOwnedToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :owned, :boolean
  end
end
