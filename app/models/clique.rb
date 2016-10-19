class Clique < ApplicationRecord
	has_and_belongs_to_many :members, class_name: "User", :join_table => :clique_has_user
	belongs_to :creator, class_name: "User"
end
