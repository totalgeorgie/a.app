class JobsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :update, :edit, :destroy] # index, show, at least partially is available to all viewers
  before_action :admin_user, only: [:new, :edit, :update, :create, :destroy] # only admins can make jobs

  def new
    @job = Job.new
    2.times {
      @job.bullets.build
      @job.roles.build
    }
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job, :notice => "Successfully created job."
    else
      render :action => 'new'
    end
  end

  def edit 
   @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      flash[:notice] = "Successfully updated Job."
      redirect_to @job, :notice => "Successfully updated job"
    else
      render :action => 'edit'
    end
  end

  def show 
    @job = Job.find(params[:id])
  end

  def index 
    @jobs = Job.paginate(page: params[:page])
  end
  
  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "Job Deleted."
    redirect_to jobs_path 
  end 

 private

  def job_params 
    params.require(:job).permit( :job_title, :job_summary, :qualifications,
                                 bullets_attributes: [:id, :bullet, :_destroy],
                                 roles_attributes: [:id, :role_title,:role_desc, :_destroy],
                                 industry_ids: [], city_ids: [], position_ids: [],
                                 questions_attributes: [:id, :content, :_destroy])
  end



end

#https://github.com/ryanb/nested_form refer to accepting params