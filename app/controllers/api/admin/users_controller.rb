class Api::Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :load_data, only: :show
  
  respond_to :html, :json

  def show
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render json: @user
    else
      render :index
    end
  end

  private
  def load_data
    @user = User.with_dependents.find(params[:id])
    @common_app = @user.common_app
    @applications = @user.applications
    @video = @user.video
  end
  
  def user_params
    params
      .require(:user)
      .permit(:name,
       :email,
       :password,
       :admin_note,
       common_app_attributes: [:resume, :grad_year, :current_city, industry_ids: []])
  end
end