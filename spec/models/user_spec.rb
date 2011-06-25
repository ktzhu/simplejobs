require 'spec_helper'

describe "A user (in general)" do
  before (:each) do
    @valid_attributes = { :name => 'someuser',
                          :password => 'secret',
                          :password_confirmation => 'secret'
                          }
    @user = User.new(@valid_attributes)
  end
  
  it "should be invalid without a name" do
    @user.name = ''
    @user.should_not be_valid
  end
  
  it "should be invalid without a password" do
    @user.password = ''
    @user.should_not be_valid
  end
  
  it "should match password and confirmation fields" do
    u = User.new({:name => 'name', :password => 'admin', :password_confirmation => 'secret'})
    u.should have(1).error_on(:password)
  end
    
  it "should create a user given valid attributes" do
    expect {
      User.create!(@valid_attributes)
    }.to change {User.count}.by(1)
  end
  
  it "should be valid with a name" do
    @user.should be_valid
  end
end