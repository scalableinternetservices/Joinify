require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "user should be M or F" do
		if sex == "M" || sex == "F"
			assert true
		else 
			assert false
		end
	end

	test "user sex should be valid" do
		user = User.new(sex: "J")
		assert_not user.valid?
	end

  # test "the truth" do
  #   assert true
  # end
end
