require 'test_helper'
require 'securerandom'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = setup_user
  end

  test "should redirect get index when not logged in" do
    get users_url
    assert_response :redirect
  end

  test "should redirect get new when not logged in" do
    get new_user_url
    assert_response :redirect
  end

  # test "should create user" do
  #   assert_difference('User.count') do
  #     post registration_path(:user), params: 
  #     { 
  #       user: { 
  #         email: @user.email,
  #         username: @user.username,
  #         password: @user.password,
  #         password_confirmation: @user.password
  #       }
  #     }
  #   end

  #   assert_redirected_to root
  # end

  # test "should show user" do
  #   get user_url(@user)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_user_url(@user)
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch user_url(@user), params: 
  #     { 
  #       user: { 
  #         age: @user.age,
  #         bio: @user.bio,
  #         email: SecureRandom.hex(4) + "@example.com",
  #         picture: @user.picture,
  #         sex: "M",
  #         username: SecureRandom.hex(4)
  #       }
  #     }
  #   assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference('User.count', -1) do
  #     delete user_url(@user)
  #   end

  #   assert_redirected_to users_url
  # end
end
