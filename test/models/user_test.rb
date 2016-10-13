require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user username should exist" do
    user = User.new
    assert_not user.valid?
  end

  test "user username should not be empty" do
    user = User.new(username: "")
    assert_not user.valid?
  end

  test "user username should not be blank" do
    user = User.new(username: "  ")
    assert_not user.valid?
  end

  test "user username should be at least 5 characters" do
    user = User.new(username: "a" * 4)
    assert_not user.valid?
  end

  test "user username should be at most 20 characters" do
    user = User.new(username: "a" * 21)
    assert_not user.valid?
  end

	test "user sex should be valid" do
		user = User.new(sex: "J")
		assert_not user.valid?
	end

  # test "the truth" do
  #   assert true
  # end
end
