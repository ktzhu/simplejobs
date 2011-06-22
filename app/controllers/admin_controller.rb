class AdminController < ApplicationController
  def index
      @total_jobs = JobPost.count
  end

end
