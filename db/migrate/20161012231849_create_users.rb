class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :age
      t.string :sex
      t.text :bio
      t.string :picture

      t.timestamps
    end
  end
end
