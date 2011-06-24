require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should login" do
    katie = users(:one)
    post :create, :name => katie.name, :password => 'private'
    assert_redirected_to admin_url
    assert_equal katie.id, session[:user_id]
  end
  
  test "should fail login" do
    katie = users(:one)
    post :create, :name => katie.name, :password => 'bleh'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to job_board_url
  end
end
