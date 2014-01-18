class JobsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :update, :edit, :destroy] # index, show, at least partially is available to all viewers
  before_action :admin_user, only: [:new, :edit, :update, :create, :destroy] # only admins can make jobs

  def new
  end

  def create
  end

  def edit 
  end

  def update
  end

  def show 
    @job = Job.find(params[:id])
    if signed_in?
      @user = current_user
      @application = Application.build(@job)
    else
      @user = User.new 
    end
  end

  def index 
    @cities = City.all
    @positions = Position.all    
    @jobs = Job.search(params).paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
  end 


end

#https://github.com/ryanb/nested_form refer to accepting params