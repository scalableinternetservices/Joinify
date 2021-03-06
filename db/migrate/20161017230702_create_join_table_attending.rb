class CreateJoinTableAttending < ActiveRecord::Migration[5.0]
  def change
    create_join_table :events, :users, table_name: :attending do |t|
      t.index [:event_id, :user_id]
      t.index [:user_id, :event_id]
    end
  end
end
