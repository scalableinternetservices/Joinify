class Event < ApplicationRecord

  validates :title, presence: true
  validates :start_date, presence: true
  validate :validate_length
  validate :validate_future

  def validate_length
  	if title.length > 50
  		errors.add(:title, "The title can't be more than 50 characters long")
  	end
  end

  def validate_future
  	if start_date < Time.now
  		errors.add(:start_date, "The start date, can't be in the past")
  	end
  end

end
