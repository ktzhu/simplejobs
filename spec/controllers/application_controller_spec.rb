require "spec_helper"

describe JobBoardController do
  render_views
  
  describe "as guest" do
    it "should render job board with index action" do
      get :index
      response.should render_template(:index)
    end
    
    it_should_require_admin_for_actions :new, :create, :edit, :update, :destroy
  end
  
  describe "as admin" do
    before (:each) do
      login_as_admin
    end
    
    it "should render new job form with new action" do
      get :new
      response.should render_template(:new)
    end
  end
end