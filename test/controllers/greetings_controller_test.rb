require 'test_helper'

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get hello_world" do
    get greetings_hello_world_url
    assert_response :success
  end

end
