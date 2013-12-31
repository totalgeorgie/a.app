class ApplicationsController < ApplicationController

  before_action :set_user_and_job
  before_action :signed_in_user
  before_action :correct_applicant, only: [:show]  

  # Test the correct applicant
  
  def new 
   job = params[:job_id]
   @application = Application.build(job)
   redirect_to jobs_path, :notice => "You've already applied to this job! Check out some more" if has_job(current_user,@job)
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to root_url, :notice =>"You have now applied!"
    else
      render :action => 'new'
    end

  end


  def edit 
  	@application = Application.find(params[:id])

  end

  def update
    @application = Application.find(params[:id])
    if @application.update(update_application_params)
      redirect_to root_url, :notice => "You have updated your application!"
    else
      render :action => 'new'
    end
  end

  def destroy
    Application.find(params[:id]).destroy
    flash[:success] = "Application Deleted."
    redirect_to root_url 
  end 

  def show 
    @application = Application.find(params[:id])
    
    @answers = []

    @job.questions.each do |question|
      @application.answers.each do |answer|
        @answers << answer if answer.question_id == question.id
      end
    end
  
  end

private

  def set_user_and_job
      @user = current_user
      @job = Job.find(params[:job_id])
  end

  def update_application_params 
     params.require(:application).permit(answers_attributes:[:id, :question_id, :content]) 
  end

  def application_params 
     params.require(:application).permit(:id, :job_id, :user_id, answers_attributes:[:question_id, :content]).merge(user_id: current_user.id, job_id: params[:job_id]) 
  end

   def correct_applicant
    @user = @application.user
    unless current_user?(@user)
       if current_user.admin?

       else
        redirect_to current_user 
      end
    end
  end
   
end

