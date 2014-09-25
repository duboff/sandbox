class AddCollegeEntryDateAndExitDateToChildren < ActiveRecord::Migration
  def change
    add_column :children, :college_entry_date, :datetime
    add_column :children, :college_exit_date, :datetime
  end
end
