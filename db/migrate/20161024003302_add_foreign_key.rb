class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
  	add_foreign_key :comments, :users, column: :creator_id
  	add_foreign_key :comments, :events, column: :host_id
  end
end
