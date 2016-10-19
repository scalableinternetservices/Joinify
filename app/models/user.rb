class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :invited_events, class_name: "Event", :join_table => :invited
  has_and_belongs_to_many :accepted_events, class_name: "Event", :join_table => :attending
  has_many :created_events, class_name: "Event"

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { in: 5..20, message: "Username must be between 5 and 20 characters long"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  validates :sex, inclusion: {in: ["M", "F", nil], message: "%{value} is not M or F"}
end
