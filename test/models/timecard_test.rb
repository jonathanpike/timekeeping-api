require 'test_helper'

class TimecardTest < ActiveSupport::TestCase
  def setup
    @no_exception = timecards(:one)
    @exception = timecards(:two)
  end 
  
  test "should create timecard" do 
    assert_difference 'Timecard.count' do 
      Timecard.create(occurrence: DateTime.now, username: "Bob")
    end 
  end 
  
  test "should not create invalid timecard" do 
    assert_no_difference 'Timecard.count' do
      Timecard.create(occurrence: DateTime.now)
    end
    
    assert_no_difference 'Timecard.count' do 
      Timecard.create(username: "Bob")
    end
  end 
  
  test "exception should be set" do 
    assert_nil @no_exception.exception
    assert_nil @exception.exception
    
    @no_exception.exception?
    assert @no_exception.reload.exception == false 
    
    @exception.exception? 
    assert @exception.reload.exception == true
  end 
  
  test "should calculate worked hours" do 
    assert_nil @no_exception.total_worked_hours 
    
    @no_exception.exception?
    @no_exception.calculate_worked_hours
    
    assert_not_nil @no_exception.total_worked_hours
  end 
  
  test "should not calculate worked hours on timecard with exception" do 
    assert_nil @exception.total_worked_hours
    
    @exception.exception?
    @exception.calculate_worked_hours
    
    assert_nil @exception.reload.total_worked_hours
  end
end
