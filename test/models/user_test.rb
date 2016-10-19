require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = setup_user
  end
  
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

  test "user email must be present" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "user email should be at most 255 characters" do
    @user.email = "a" * 255 + '@example.com'
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

	test "user sex should be valid" do
		user = User.new(sex: "J")
		assert_not user.valid?
	end

  # test "the truth" do
  #   assert true
  # end
end
