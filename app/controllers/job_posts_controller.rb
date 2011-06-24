class JobPostsController < ApplicationController
  # GET /job_posts
  def index
    @job_posts = JobPost.all
  end
  
  # GET /job_posts/1
  def show
    @job_post = JobPost.find(params[:id])
  end
  
  # GET /job_posts/new
  def new
    @job_post = JobPost.new
  end
  
  # GET /job_posts/1/edit
  def edit
    @job_post = JobPost.find(params[:id])
  end
  
  # POST /job_posts
  def create
    @job_post = JobPost.new(params[:job_post])  
    # logger.info @job_post.inspect
    # logger.info @job_post.valid?
    # logger.info @job_post.errors.inspect
    
    if @job_post.save
      redirect_to(@job_post, :notice => 'Your job post was successfully created.')
    else
      render :action => "new"
    end
  end
  
  # PUT /job_posts/1
  def update
    @job_post = JobPost.find(params[:id])
    
    if @job_post.update_attributes(params[:job_post])
      redirect_to(@job_post, :notice => 'Your job post was successfully updated.')
    else
      render :action => "edit"
    end
  end
  
  # DELETE /job_posts/1
  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy
    
    redirect_to(job_posts_url)
  end
end