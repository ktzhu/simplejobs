require 'test_helper'

class JobPostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "job post attributes must not be empty" do
    job_post = JobPost.new
    assert job_post.invalid?
    assert job_post.errors[:title].any?
    assert job_post.errors[:company].any?
    assert job_post.errors[:description].any?
    assert job_post.errors[:location].any?
    assert job_post.errors[:experience].any?
    assert job_post.errors[:skills].any?
    assert job_post.errors[:industry].any?
    assert job_post.errors[:pay].any?
  end
  
  test "job pay must be positive" do
    job_post = JobPost.new( :title        => "Cool Master",
                            :company      => "GOOD",
                            :description  => "Be cool.",
                            :location     => "Los Angeles, CA",
                            :experience   => "None required.",
                            :skills       => "Be awesome.",
                            :industry     => "New Media")
    job_post.pay = -1
    assert job_post.invalid?
    assert_equal "must be greater than or equal to 0.01", job_post.errors[:pay].join('; ')
    
    job_post.pay = 1
    assert job_post.valid?
  end
end