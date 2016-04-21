require 'test_helper'

class TimeEntryTest < ActiveSupport::TestCase
  def setup 
    @timecard = timecards(:one)
  end 
  
  test "should create new time entry" do
    assert_difference 'TimeEntry.count' do 
      TimeEntry.create(time: Time.now, timecard_id: @timecard.id)
    end 
  end
  
  test "should not save invalid time entry" do 
    assert_no_difference 'TimeEntry.count' do
      TimeEntry.create(timecard_id: @timecard.id)
    end 
  end 
end
