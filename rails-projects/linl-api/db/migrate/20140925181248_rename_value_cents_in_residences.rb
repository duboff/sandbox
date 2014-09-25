class RenameValueCentsInResidences < ActiveRecord::Migration
  def change
    rename_column :residences, :value_cents, :current_value_cents
  end
end
