class JobsController < ApplicationController
  def show 
    @job = Job
      .includes(:industries)
      .includes(:cities)
      .includes(:bullets)
      .includes(:roles)
      .find(params[:id])
    @application = Application.build(@job)
    @user = User.new 
  end

  def index 
    @cities = City.all
    @positions = Position.all    
    @jobs = Job.search(params)
      .paginate(page: params[:page], per_page: 5)
  end
end
