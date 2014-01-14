class ApplicationsController < ApplicationController

  before_action :set_user_and_job
  before_action :signed_in_user
  before_action :correct_applicant, only: [:show, :edit, :update]  

  def new
  end
  
  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to @user, :notice =>"You have now applied!"
    else
      render 'jobs/show'
    end

  end


  def edit 
  end

  def update
    if @application.update(application_params)
      redirect_to @user, :notice => "You have updated your application!"
    else
      render :action => 'new'
    end
  end

  def destroy
    Application.find(params[:id]).destroy
    flash[:success] = "Application Deleted."
    redirect_to @user 
  end 

  def show 
    @answers = []
    @job.questions.each do |question|
      @application.answers.each do |answer|
        @answers << answer if answer.question_id == question.id
      end
    end
  end

private

  def set_user_and_job
      @user = current_user if current_user
      @job = Job.find(params[:job_id])
  end

  def application_params 
     params.require(:application).permit(:id, :job_id, :user_id, answers_attributes:[:question_id, :content, :id]).merge(user_id: current_user.id, job_id: params[:job_id]) 
  end

   def correct_applicant
    @application = Application.find(params[:id])
    @user = @application.user
    redirect_to current_user unless current_user?(@user) || current_user.admin? 
  end
   
end

