require 'test_helper'

class TimecardsControllerTest < ActionController::TestCase
  def setup 
    @controller = Api::V1::TimecardsController.new
    @card = timecards(:one)
  end 
  
  test "should get index" do 
    get :index
    assert_response :success
  end
  
  test "should be able to create" do 
    assert_difference 'Timecard.count' do 
      post :create, timecard: { occurrence: Date.today, 
                                username: "Bob" }
    end 
    assert_response :created
  end
  
  test "create should fail with invalid params" do 
    assert_no_difference 'Timecard.count' do 
      post :create, timecard: { username: "Bobby" } 
    end 
    assert_response :unprocessable_entity
  end
  
  test "should be able to update" do 
    assert @card.username == "Cooper"
    put :update, id: @card.id, timecard: { username: "Romilly" }
    assert_response :ok
    assert @card.reload.username == "Romilly"
  end

  test "should be able to destroy" do 
    assert_difference 'Timecard.count', -1 do 
      delete :destroy, id: @card.id
    end 
    assert_response :ok
  end 
end
