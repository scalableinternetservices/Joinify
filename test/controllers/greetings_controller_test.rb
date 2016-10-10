require 'test_helper'

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  test "should be root_url and return successful response" do
    get root_url
    assert_response :success
  end

end
