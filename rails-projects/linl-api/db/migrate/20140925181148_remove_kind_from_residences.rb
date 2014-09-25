class RemoveKindFromResidences < ActiveRecord::Migration
  def change
    remove_column :residences, :kind
  end
end
