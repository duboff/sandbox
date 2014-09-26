class RemoveMaritalStatusFromPartners < ActiveRecord::Migration
  def change
    remove_column :partners, :marital_status
  end
end
