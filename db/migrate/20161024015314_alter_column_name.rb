class AlterColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :comments, :host_id, :event_id
  end
end
