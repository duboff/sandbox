class AddRothFirstToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roth_first, :bool
  end
end
