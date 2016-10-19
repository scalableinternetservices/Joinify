require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup()
    @event = setup_event
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
  test "Start date should be present" do
    @event.start_date = "  "
    assert_not @event.valid?
  end

  test "Start date should not be in the past" do
  	@event.start_date = "2016-10-07 19:00:00"
  	assert_not @event.valid?
  end

  #latitude


  #longtitude


  #description
  test "description should not be more than 255 characters" do
    @event.description = "x"*256
    assert_not @event.valid?
  end

end
