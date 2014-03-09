class ApplicationsController < ApplicationController
  before_action :signed_in_user
  # before_action :correct_applicant, only: [:show, :edit, :update]  

  def create
    @job = Job.with_info.find(params[:job_id])
    @user = current_user
    @application = @user.applications.new(application_params)
    @application.job_id = @job.id

    if @application.save
      flash[:success] = "You've Successfully applied!"
      redirect_to @user
    else
      update_answers
      render 'jobs/show'
    end
  end

  # def edit 
  # end

  # def update
  #   if @application.update(application_params)
  #     redirect_to @user, :notice => "You have updated your application!"
  #   else
  #     render :action => 'new'
  #   end
  # end

  # def destroy
  #   Application.find(params[:id]).destroy
  #   flash[:success] = "Application Deleted."
  #   redirect_to @user 
  # end 

  private
  def application_params 
     params
      .require(:application)
      .permit(answers_attributes: [:question_id, :content, :id, :video_uuid])
  end

  def update_answers
    @application = Application.build(@job, @application) if @application.answers.empty?
  end

  # def correct_applicant
  #   @application = Application.find(params[:id])
  #   redirect_to current_user unless (current_user?(@application.user) || current_user.admin?)
  # end  
end

