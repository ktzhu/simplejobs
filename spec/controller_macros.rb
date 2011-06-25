module ControllerMacros
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def it_should_require_admin_for_actions(*actions)
      actions.each do |action|
        it "#{action} action should require admin" do
          get action, :id => 1
          response.should redirect_to(login_url)
          flash[:error].should == "Unauthorized Access"
        end
      end
    end
  end
  
  def login_as_admin
    user = User.new(:user => "admin", :password => "secret", :password_confirmation => "secret")
    user.save!
    session[:user_id] = user.id
  end
end