class Admin::JobsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user

  def new
    @job = Job.new
    2.times {
      @job.bullets.build
      @job.roles.build
      @job.questions.build
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

  def destroy
    Job.find(params[:id]).destroy
    flash[:success] = "Job Deleted."
    redirect_to jobs_path 
  end

  def index
    @cities = City.all
    @positions = Position.all
    @jobs = Job.search(params)
    @jobs = @jobs.order(sort_job_column + " " + sort_direction)
    @jobs = @jobs.paginate(page: params[:page], per_page: 20)
  end

  def show
    @job = Job.find(params[:id])
    @application = Application.new
    @applications = @job.applications 
    @applications = @applications.joins(:user).order("users.#{sort_user_column}" + " " + sort_direction)
    @applications = @applications.paginate(page: params[:page], per_page: 3)
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
