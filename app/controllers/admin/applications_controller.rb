class Admin::ApplicationsController < ApplicationController
  before_action :admin_user

  def update
    @application = Application.find(params[:id])
    if @application.update_attributes(application_params)
      render json: @application
    else
      render json: @application.errors, status: 400
    end
  end

  private
  def application_params 
    params.require(:application).permit(:shortlisted, :status)
  end
end