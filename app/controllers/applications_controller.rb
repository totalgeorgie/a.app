class ApplicationsController < ApplicationController

  def new 
 	@job = Job.find(params[:job_id])
 	@user = current_user 

 	@application = Application.new() 
 	
 	@job.questions.count.times do 
 		 @application.answers.build 
 	end 

  end

  def create
  	@user = current_user 
  	@job = Job.find(params[:job_id])
    @application = Application.new(application_params)
    @application.job_id = @job.id
    if @application.save
    	redirect_to root_url, :notice => "You have now applied!"
    else
    	render :action => 'new'
    end
  end


private

  def application_params
    params.require(:application).permit(:job_id, :user_id, answers_attributes:[:content, :question_id]).merge(user_id: current_user.id)
  end

end

