class Admin::UsersController < ApplicationController
  before_action :admin_user
  respond_to :html, :json

  def index
    @users = User.search(params).paginate(page: params[:page], per_page: 30)
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

  def show
    @user = User.with_dependents.find(params[:id])
  end

  private
  def user_params
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation, :heat_id, :admin_note, :source_id)
  end  
end