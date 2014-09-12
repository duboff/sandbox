class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :user_id
      t.string :name
      t.datetime :birthdate
      t.integer :expected_tuition_cents, limit: 8

      t.timestamps
    end
    add_index :children, :user_id
  end
end
