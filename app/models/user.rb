class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { in: 5..20, message: "Username must be between 5 and 20 characters long"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  validates :sex, inclusion: {in: ["M", "F", nil], message: "%{value} is not M or F"}
end
