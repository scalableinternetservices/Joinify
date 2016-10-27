class AddHostIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :host_id, :integer
  end
end
