require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase
  def setup 
    @controller = Api::V1::TimeEntriesController.new
    @card1 = timecards(:one)
    @card2 = timecards(:two)
    @entry = time_entries(:one)
  end 
  
  test "should get index" do 
    get :index
    assert_response :success
  end
  
  test "should be able to create" do 
    assert_difference 'TimeEntry.count' do 
      post :create, time_entry: { time: DateTime.now, 
                                  timecard_id: @card2.id }
    end 
    assert_not_nil @card2.reload.total_worked_hours
    assert @card2.reload.exception == false
    assert_response :created
  end
  
  test "create should fail with invalid params" do 
    assert_no_difference 'TimeEntry.count' do 
      post :create, time_entry: { timecard_id: @card2.id } 
    end 
    assert_response :unprocessable_entity
  end
  
  test "should be able to update" do 
    orig_total_worked = @card1.total_worked_hours
    assert @entry.time == DateTime.new(2001, 2, 3, 4, 5, 6, '+7')
    put :update, id: @entry.id, time_entry: { time: DateTime.new(2001, 2, 3, 5, 6, 7, '+7') }
    assert_response :ok
    assert @entry.reload.time == DateTime.new(2001, 2, 3, 5, 6, 7, '+7')
    assert_not_equal orig_total_worked, @card1.reload.total_worked_hours
  end

  test "should be able to destroy" do 
    assert_difference 'TimeEntry.count', -1 do 
      delete :destroy, id: @entry.id
    end 
    assert_response :ok
  end 
end
