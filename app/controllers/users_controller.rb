class UsersController < ApplicationController
  skip_before_filter :authorize
  
  # GET /users
  def index
    @users = User.order(:name)
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    logger.info @user.inspect
    logger.info @user.valid?
    logger.info @user.errors.inspect
    if @user.save
      redirect_to(users_url, :notice => "User #{@user.name} was successfully created.")
    else
      render :action => "new"
    end
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(users_url, :notice => "User #{@user.name} was successfully updated.")
    else
      render :action => "edit"
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted."
    rescue Exception => e
      flash [:notice] = e.message
    end
    
    redirect_to(users_url)
  end
end
