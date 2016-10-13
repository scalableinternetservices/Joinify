class User < ApplicationRecord
  validates :username, presence: true, length: { in: 5..20 }
  validates :sex, inclusion: {in: ["M", "F", nil], message: "%{value} is not M or F"}
end
