class Admin::ApplicationsController < ApplicationController
  before_action :admin_user

  def create
    @application = Application.make_by_admin(application_params)
    if @application.save
      redirect_to admin_user_path(@application.user)
    else
      flash[:danger] = "Association was not saved"
      redirect_to admin_user_path(@application.user)
    end
  end

  private
  def application_params
    params.require(:application).permit(:job_id, :user_id)
  end
end