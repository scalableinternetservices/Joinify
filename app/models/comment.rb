class Comment < ApplicationRecord
	belongs_to :host, class_name: "Event"
	belongs_to :creator, class_name: "User"

	

end
