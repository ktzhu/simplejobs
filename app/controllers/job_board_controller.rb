class JobBoardController < ApplicationController
  skip_before_filter :authorize

  def index
    @job_posts = JobPost.all
  end

end
