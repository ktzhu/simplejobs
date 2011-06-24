require 'test_helper'

class JobBoardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#wrapper #mainNav a', :minimum => 3
    assert_select 'h1', "your simple Job Board"
  end
end