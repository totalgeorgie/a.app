class ApplicationsController < ApplicationController

	#need sign in user, and correct user on this. 


  def new 
 	@job = Job.find(params[:job_id])
 	@user = current_user 

 	@application = Application.new() 
 	
 	@job.questions.count.times do 
 		 @application.answers.build 
 	end 

  end

  def edit 
 	@job = Job.find(params[:job_id])
 	@user = current_user 
 	@application = Application.find(params[:id])
    @answers = []

    @job.questions.each do |question|
      @application.answers.each do |answer|
        @answers << answer if answer.question_id == question.id
      end
    end

  end

  def update
    @job = Job.find(params[:job_id])
    @user = current_user 
    @application = Application.find(params[:id])

    if @application.update_attributes(application_params)
      redirect_to root_url, :notice => "You have update your application!"
    else
      render :action => 'new'
    end
  end

  #Updated doesn't work. It doesn't actually get the correct update 



  def show 
 	  @job = Job.find(params[:job_id])
 	  @user = current_user 
 	  @application = Application.find(params[:id])
    
    @answers = []

    @job.questions.each do |question|
      @application.answers.each do |answer|
        @answers << answer if answer.question_id == question.id
      end
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

  def destroy
    Application.find(params[:id]).destroy
    flash[:success] = "Application Deleted."
    redirect_to root_url 
  end 


private

  def application_params
    params.require(:application).permit(:job_id, :user_id, answers_attributes:[:content, :question_id]).merge(user_id: current_user.id)
  end

end

