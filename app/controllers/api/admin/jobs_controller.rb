class Api::Admin::JobsController < ApplicationController
  before_action :admin_user
  before_action :load_data, except: :show

  def show
    @applications = Application.for_job(params[:id])
  end

  def potentials
    @users = Job.find(params[:id]).potentials
  end
  
  private
  def job_params 
    params.require(:job).permit(:job_title, :job_summary, :qualifications,
      bullets_attributes: [:id, :bullet, :_destroy],
      roles_attributes: [:id, :role_title,:role_desc, :_destroy],
      questions_attributes: [:id, :content, :_destroy],
      industry_ids: [],
      city_ids: [],
      position_ids: [])
  end

  def load_data
    @industries = Industry.all.collect { |industry| [industry.name, industry.id] }
    @cities = City.all.collect { |city| [city.name, city.id] }
  end

  def set_job
    @job = Job.with_info.find(params[:id])
  end
end