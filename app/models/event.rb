
class Event < ApplicationRecord
  has_and_belongs_to_many :invitees, class_name: "User", :join_table => :invited
  has_and_belongs_to_many :attendees, class_name: "User", :join_table => :attending
  belongs_to :owner, class_name: "User"


  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "metallica.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  has_many :comments, class_name: "Comment"

  validates :title, presence: true
  validate :validate_title_length
  validates :start_date, presence: true
  validate :validate_future
  validate :validate_decription_length

  def date
    start_date.strftime("%A, %B %d at %l:%M %p")
  end

  def distance_to(location)
    return 2**100 if (latitude.nil? || longitude.nil?)
    Math.sqrt((latitude - location[:latitude])**2 + (longitude - location[:longitude])**2)
  end
  
  private

  def validate_title_length
  	if title.length > 50
  		errors.add(:title, "The title can't be more than 50 characters long")
  	end
  end

  def validate_future
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "can't be in the past")
    end
  end

  def validate_decription_length
    if description.length > 255
      errors.add(:description, "The description can't be more than 255 characters long")
    end
  end

end
