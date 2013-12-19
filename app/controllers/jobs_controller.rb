class JobsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :update, :show, :edit, :destroy] # index, at least partially is available to all viewers
  before_action :admin_user, only: [:new, :edit, :update, :create, :destroy] # only admins can make jobs

  def new
    @job = Job.new
    3.times {
      @job.bullets.build
      @job.roles.build
    }
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @survey, :notice => "Successfully created survey."
    else
      render :action => 'new'
    end
  end

  def job_params 
    params.require(:job).permit(:id, :job_title, :job_summary, :qualifications,
                                 bullets_attributes: [:id, :bullet, :_destroy],
                                 roles_attributes: [:id, :role_title,:role_desc, :_destroy])
  end

end

#https://github.com/ryanb/nested_form refer to accepting params