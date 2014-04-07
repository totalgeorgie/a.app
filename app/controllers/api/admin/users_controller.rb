class Admin::UsersController < ApplicationController
  before_action :admin_user
  respond_to :html, :json

  def show
    @user = User.with_dependents.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User successfully updated"
      redirect_to admin_user_path(@user)
    else
      render :index
    end
  end

  private
  def user_params
    params
      .require(:user)
      .permit(:name,
       :email,
       :password,
       :heat_id,
       :admin_note,
       :source_id,
       common_app_attributes: [:resume, :grad_year, :current_city, industry_ids: []])
  end
end