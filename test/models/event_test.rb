require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup()
  	@event = Event.new(title:"Metallica concert", latitude: 34.412593, longitude: -119.859737, start_date: "2016-10-15 19:00:00", description: "Hi", is_public: true, media_path: "/app/assets/images/metallica.jpg")
  end
  
# Event
  test "should be valid" do
    assert @event.valid?
  end

# Title
  test "Title should be present" do 
  	@event.title = " "
  	assert_not @event.valid?
  end

  test "Title should not be too long" do
  	@event.title = "x" * 51
  	assert_not @event.valid?
  end

# Start Date
  test "Start date should not be in the past" do
  	@event.start_date = "2016-10-07 19:00:00"
  	assert_not @event.valid?
  end

  test "Start date should be present" do
    @event.start_date = " "
    assert_not @event.valid?
  end

end
