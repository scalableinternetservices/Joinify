ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'securerandom'

class ActiveSupport::TestCase
  include Devise::TestHelpers
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def setup_user
    User.new( 
      age: 5,
      bio: "My test bio",
      password: SecureRandom.hex(6),
      email: SecureRandom.hex(4) + "@example.com",
      picture: "blah.jpg",
      sex: "M",
      username: SecureRandom.hex(4)
    )
  end

  def setup_event
    @user = setup_user
    @user.save
    @event = Event.new(
      title:"Metallica concert",
      latitude: 34.412593,
      longitude: -119.859737,
      start_date: "2017-10-10 19:00:00",
      description: "Hi",
      is_public: true,
      media_path: "/app/assets/images/metallica.jpg",
      owner_id: @user.id
    )
  end
end
