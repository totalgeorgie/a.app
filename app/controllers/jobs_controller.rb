class JobsController < ApplicationController
  before_action :load_data, only: :index

  def index    
    @jobs = Job
      .with_filters(city, industry)
      .paginate(page: params[:page], per_page: 5)
  end

  def show 
    @job = Job.with_info.find(params[:id])    
    @user = current_user || User.new
    @user.common_app ? nil : @user.build_common_app 
    @application = Application.build(@job)
    render :show
    record_hit
  end

  def blurb
    @jobs = Job.includes(:industries).includes(:cities).pop(2)
  end
  
  def refer
    if valid_referral
      flash[:success] = "We've sent your referral! Thank you"
      UserMailer.send_refer(params[:referer], params[:referee]).deliver
    else
      flash[:error] = "You haven't entered the proper emails, please try again"
    end

    redirect_to job_url(params[:job_id])
  end

  private

  def load_data
    @cities = City.all
    @industries = Industry.all
  end

  def city
    params[:city_id].blank? ? nil : params[:city_id]
  end

  def industry
    params[:industry_id].blank? ? nil : params[:industry_id]
  end
  
  def record_hit
    unless current_user && current_user.admin
      @job.hit_count += 1
      @job.save!
    end
  end

  def valid_referral
    !params[:referer].blank? && !params[:referee].blank?
  end
end