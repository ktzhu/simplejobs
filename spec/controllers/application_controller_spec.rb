require "spec_helper"

describe JobBoardController do
  fixtures :all
  render_views
  
  describe "as guest" do
    it "should render job board with index action" do
      get :index
      response.should render_template(:index)
    end
    
    
  end
end