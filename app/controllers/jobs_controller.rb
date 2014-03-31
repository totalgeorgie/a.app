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
    @user.common_app ? nil : @user.build_common_app 
    @application = Application.build(@job)
    record_hit
  end

  private
  def load_data
    @cities = City.all
  end

  def city
    @city ||= City.find(params[:city_id]) unless params[:city_id].blank?
  end
  
  def record_hit
    unless current_user && current_user.admin
      @job.hit_count += 1
      @job.save!
    end
  end
end
