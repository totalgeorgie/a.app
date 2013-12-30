class ApplicationsController < ApplicationController

	#need sign in user, and correct user on this. 
  before_filter :set_user_and_job


  def new 
   job = params[:job_id]
   @application = Application.build(job)

  end

  def create
    @application = Application.new(application_params)
    
    if @application.save
      redirect_to root_url, :notice => "You have now applied!"
    else 
      render :action => 'new'
    end

    #make this either an if statement, or make the validates on application work 
  end


  def edit 
  	@application = Application.find(params[:id])

    @answers = []

    @job.questions.each do |question|
      @application.answers.each do |answer|
        @answers << answer if answer.question_id == question.id
      end
    end

  end

  def update
    @application = Application.find(params[:id])

    if @application.update_attributes(application_params)
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

def application_params 
params.require(:application).permit(:job_id, :user_id, 
questions_attributes: [answer_attributes:[:content]]).merge(user_id: current_user.id, 
job_id: params[:job_id]) 
end

end

