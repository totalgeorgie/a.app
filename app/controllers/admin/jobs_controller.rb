class Admin::JobsController < ApplicationController
  before_action :admin_user
  before_action :load_data, except: [:index, :show, :destroy]
  before_action :set_job, only: [:edit, :update]

  def index
    @jobs = Job.with_search(params[:search])
      .paginate(page: params[:page], per_page: 5)
  end

  def show
  end
  
  def new
    @job = Job.build
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job Succesfuly created"
      redirect_to admin_jobs_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update_attributes(job_params)
      flash[:success] = "Successfully updated Job."
      redirect_to admin_job_url(@job)
    else
      render :action => 'edit'
    end
  end

  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "Job Deleted."
    redirect_to admin_jobs_url 
  end

  private
  def job_params 
    params.require(:job).permit(
      :job_title,
      :job_summary,
      :qualifications,
      
      industry_ids: [],
      city_ids: [],
      role_type_ids: [],    
      
      bullets_attributes: [:id, :bullet, :_destroy],
      job_ideals_attributes: [:id, :content, :_destroy],
      roles_attributes: [:id, :role_title, :role_desc, :_destroy],
      questions_attributes: [:id, :content, :_destroy]
    )
  end

  def load_data
    @industries = Industry.all.collect { |industry| [industry.name, industry.id] }
    @cities = City.all.collect { |city| [city.name, city.id] }
    @role_types = RoleType.all.collect { |role_type| [role_type.name, role_type.id] }
  end

  def set_job
    @job = Job.with_info.find(params[:id])
  end
end