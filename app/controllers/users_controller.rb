class UsersController < ApplicationController
  before_action :signed_in_user, except: [:new, :create]
  before_action :correct_user,   except: [:new, :create]
  
  def new
    redirect_to current_user if current_user
    @user = User.new
  end

  def show
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

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Your settings are updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def correct_user 
    @user = User.with_dependents.find(params[:id])
    redirect_to current_user unless current_user?(@user) || current_user.admin?
  end
end