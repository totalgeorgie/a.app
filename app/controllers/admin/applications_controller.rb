class Admin::ApplicationsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user
  before_action :set_user_and_job

  def create
    @application = Application.new(application_params)        
    @job.questions.each do |question|
     @application.answers.build(question_id: question.id, content: "N/A")
    end
    redirect_to admin_user_path(@user), :notice => "#{@user.first_name} has already applied to this job" and return if has_job(@user, @job)
    if @application.save
      redirect_to admin_user_path(@user), :notice =>"You have now applied!"
    else
      redirect_to admin_user_path(@user)
    end
  end

private
  
  def set_user_and_job
    @user = User.find(params[:application][:user_id])
    @job = Job.find(params[:application][:job_id])
  end

  def application_params 
     params.require(:application).permit(:id, :job_id, :user_id, answers_attributes:[:question_id, :content, :id])
  end

end
