require 'spec_helper'

describe JobPost do
  before(:each) do
    @valid_attributes = {
      :title => "Software Developer",
      :company => "Google",
      :description => "Describe job here",
      :location => "Mountain View",
      :experience => "Lots",
      :skills => "All",
      :industry => "CS",
      :pay => 500
    }
  end
  
  it "creates a valid JobPost given valid attributes" do
    lambda {
      JobPost.create(@valid_attributes)
    }.should change(JobPost, :count).by(1)
  end
  
  it "should save the job title" do
    j = JobPost.create(@valid_attributes)
    j.title.should == "Software Developer"
  end
  
  it "must have a company" do
    lambda {
      JobPost.create({:company => ''})
    }.should_not change(JobPost, :count)
  end
  
  it "must have a location" do
    j = JobPost.new({ :title => "Blah",
                      :company => "Blahblah",
                      :description => "Bleh",
                      :location => '',
                      :experience => "Blah",
                      :skills => "None",
                      :industry => "CS",
                      :pay => 10})
    j.should_not be_valid
  end
end