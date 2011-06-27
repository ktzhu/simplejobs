require "spec_helper"

describe ApplicationController do
  
  before(:each) do
    User.stub!(:find).and_return(@user = mock_model(User, :save! => true, :id => 1))
  end
  
  controller do
    def index
      session[:user] = current_user
      render :text => ""
    end
  end
  
  it "should return nil if there is no user_id in the session" do
    get :index
    session[:user].should == nil
  end
  
  it "should return the user if there is a user_id in the session" do
    session[:user_id] = 1
    get :index
    session[:user].should_not be_nil
  end
end