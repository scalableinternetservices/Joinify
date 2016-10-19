class AddOwnerIdToEventsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :owner_id, :integer, :null => false
    add_foreign_key :events, :users, column: :owner_id
  end
end
