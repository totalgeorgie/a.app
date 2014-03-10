class ApplicationsController < ApplicationController
  before_action :signed_in_user
  before_action :build_application, only: :create
  before_action :find_application, only: [:show, :edit, :update]
  
  def edit
  end

  def show
  end

  def create
    if @application.save
      flash[:success] = "You've Successfully applied!"
      redirect_to current_user
    else
      update_answers
      render 'jobs/show'
    end
  end

  def update
    if @application.update(application_params)
      flash[:success] = "You have updated your application!"
      redirect_to current_user
    else
      render :edit
    end   
  end

  def destroy
    application = current_user.applications.find(params[:id])
    application.destroy
    flash[:success] = "Your Application is removed"
    redirect_to current_user
  end

  private
  def application_params 
     params
      .require(:application)
      .permit(answers_attributes: [:question_id, :content, :id, :video_uuid])
  end

  def build_application
    @job = Job.with_info.find(params[:job_id])
    @user = current_user
    @application = @user.applications.new(application_params)
    @application.job_id = @job.id
  end

  def update_answers
    @application = Application.build(@job, @application) if @application.answers.empty?
  end

  def find_application
    @application = current_user.applications.with_dependents.find(params[:id])
  end
end

