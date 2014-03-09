class JobsController < ApplicationController
  before_action :load_data, only: :index

  def index    
    @jobs = Job
      .with_cities(city)
      .paginate(page: params[:page], per_page: 5)
  end

  def show 
    @job = Job.with_info.find(params[:id])    
    
    @user = current_user || User.new
    @application = Application.build(@job)
    
  end

  private
  def load_data
    @cities = City.all
    @positions = Position.all
  end

  def city
    @city ||= City.find(params[:city_id]) unless params[:city_id].blank?
  end
end
