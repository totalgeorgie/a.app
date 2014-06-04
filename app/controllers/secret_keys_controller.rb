class SecretKeysController < ApplicationController
  before_action :admin_user, only: [:show, :create]
  before_action :valid_key_holder, except: [:show, :create]
  before_action :load_data, except: [:show, :create]
  
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
  end

  def create_job
    @job = Job.new(job_params)
    if @job.save
      @key.invalidate!
      flash[:success] = "Job Succesfuly created"
      redirect_to job_url(@job)
    else
      render :new_job
    end
  end

  private
  def load_data
    @industries = Industry.all.collect { |industry| [industry.name, industry.id] }
    @cities = City.all.collect { |city| [city.name, city.id] }
    @role_types = RoleType.all.collect { |role_type| [role_type.name, role_type.id] }
  end

  def key_params
    params.require(:key).permit(:code)
  end

  def valid_key_holder
    code = params[:code] || params[:job][:code]
    @key = SecretKey.find_by(code: code)
    redirect_to root_url unless @key && @key.still_valid?
  end

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
end
