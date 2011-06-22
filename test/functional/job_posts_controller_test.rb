require 'test_helper'

class JobPostsControllerTest < ActionController::TestCase
  setup do
    @job_post = job_posts(:one)
    @update = {
      :title        => 'Designer',
      :company      => 'GOOD',
      :description  => 'Work hard.',
      :location     => 'Los Angeles, CA',
      :experience   => 'Lots.',
      :skills       => 'All of them.',
      :pay          => '250.45'
    }
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_posts)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create job" do
    assert_difference('JobPost.count') do
      post :create, :job_post => @update
    end
    
    assert_redirected_to_job_post_path(assigns(:job_post))
  end
  
  test "should update job" do
    put :update, :id => @job_post.to_param, :job_post => @update
    assert_redirected_to job_post_path(assigns(:job_post))
  end
  
  test "should show job" do
    get :show, :id => @job_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @job_post.to_param
    assert_response :success
  end

  test "should destroy job" do
    assert_difference('JobPost.count', -1) do
      delete :destroy, :id => @job_post.to_param
    end

    assert_redirected_to job_post_path
  end

end