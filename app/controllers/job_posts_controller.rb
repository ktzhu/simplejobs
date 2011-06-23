class JobPostsController < ApplicationController
  skip_before_filter :authorize
  # GET /job_posts
  # GET /job_posts.xml
  def index
    @job_posts = JobPost.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @job_posts }
    end
  end
  
  # GET /job_posts/1
  # GET /job_posts/1.xml
  def show
    @job_post = JobPost.find(params[:id])
  end
  
  # GET /job_posts/new
  # GET /job_posts/new.xml
  def new
    @job_post = JobPost.new
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @job_post }
    end
  end
  
  # GET /job_posts/1/edit
  def edit
    @job_post = JobPost.find(params[:id])
  end
  
  # POST /job_posts
  # POST /job_posts.xml
  def create
    @job_post = JobPost.new(params[:job_post])  
    
    if @job_post.save
      redirect_to(@job_post, :notice => 'Your job post was successfully created.')
    else
      render :action => "new"
    end
  end
  
  # PUT /job_posts/1
  # PUT /job_posts/1.xml
  def update
    @job_post = JobPost.find(params[:id])
    
    if @job_post.update_attributes(params[:job_post])
      redirect_to(@job_post, :notice => 'Your job post was successfully updated.')
    else
      render :action => "edit"
    end
  end
  
  # DELETE /job_posts/1
  # DELETE /job_posts/1,xml
  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy
    
    respond_to do |format|
      format.html { redirect_to(job_posts_url) }
    end
  end
end