class Admin::JobsController < ApplicationController
  before_action :admin_user
  before_action :set_job 

  def index
    @jobs = Job.with_info.all
  end

  def show
    @job = Job.with_info.find(params[:id])
  end
  
  def new
    @job = Job.build
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job Succesfuly created"
      redirect_to @job
    else
      render :new
    end
  end

  def edit
   @job = Job.with_info.find(params[:id])
  end

  def update
    @job = Job.with_info.find(params[:id])
    
    if @job.update_attributes(job_params)
      flash[:success] = "Successfully updated Job."
      redirect_to @job
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
    params.require(:job).permit(:job_title, :job_summary, :qualifications,
      bullets_attributes: [:id, :bullet, :_destroy],
      roles_attributes: [:id, :role_title,:role_desc, :_destroy],
      questions_attributes: [:id, :content, :_destroy]
      industry_ids: [],
      city_ids: [],
      position_ids: [],)
  end
end