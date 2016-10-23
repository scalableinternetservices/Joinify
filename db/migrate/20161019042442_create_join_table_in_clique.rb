class CreateJoinTableInClique < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cliques, :users, table_name: :clique_has_user do |t|
       t.index [:clique_id, :user_id]
       t.index [:user_id, :clique_id]
    end
  end
end
