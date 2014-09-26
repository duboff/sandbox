class AddMaritalStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :marital_status, :boolean
  end
end
