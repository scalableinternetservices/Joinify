class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.datetime :start_date
      t.string :description
      t.boolean :is_public
      t.string :media_path

      t.timestamps
    end
  end
end
