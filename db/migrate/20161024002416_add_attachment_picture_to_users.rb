class AddAttachmentPictureToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :picture
    change_table :users do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :users, :picture
    add_column :users, :picture, :text
  end
end
