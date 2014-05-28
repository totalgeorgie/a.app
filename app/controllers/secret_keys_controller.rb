class SecretKeysController < ApplicationController
  before_action :admin_user, only: [:create, :show]
  before_action :valid_key_holder, except: [:show, :create]
  
  def show
    @key = SecretKey.find(params[:id])
  end

  def create
    @key = SecretKey.generate_key!
    flash[:success] = "Send the link below and the client will be able to create a job!"
    redirect_to secret_key_url(@key)
  end

  def new_job
    @job = Job.build
    render 'jobs/new'
  end

  def create_job
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job Succesfuly created"
      redirect_to admin_jobs_url
      @key.invalidate!
    else
      render 'jobs/new'
    end
  end

  private
  def key_params
    params.require(:key).permit(:code)
  end

  def valid_key_holder
    @key = SecretKey.find(code: params[:code])
    redirect_to root_url unless @key && @key.valid?
  end

  def job_params 
    params.require(:job).permit(
      :job_title,
      :job_summary,
      :qualifications,
      
      industry_ids: [],
      city_ids: [],
      position_ids: [],    
      
      bullets_attributes: [:id, :bullet, :_destroy],
      job_ideals_attributes: [:id, :content, :_destroy],
      roles_attributes: [:id, :role_title, :role_desc, :_destroy],
      questions_attributes: [:id, :content, :_destroy]
    )
  end
end
