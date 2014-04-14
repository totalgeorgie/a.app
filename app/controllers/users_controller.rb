class UsersController < ApplicationController
  before_action :signed_in_user, only: :show
  before_action :correct_user,   only: :show
  
  def new
    redirect_to current_user if current_user
    @user = User.new
  end

  def show
  end

  def share
    @user = User.includes(:common_app, :video)
      .find_by(admin_link: params[:admin_link])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Atlas China #{@user.name}!"
      redirect_back_or @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, { common_app_attributes: [:resume] } )
  end

  def correct_user 
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user) || current_user.admin?
  end
end