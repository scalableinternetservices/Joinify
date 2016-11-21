class Comment < ApplicationRecord
	belongs_to :event, touch: true
	belongs_to :creator, class_name: "User"

end
