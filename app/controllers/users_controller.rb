class UsersController < ApplicationController
  before_action :signed_in_user, except: [:new, :create]
  before_action :correct_user,   except: [:new, :create]
  before_action :load_data, only: :show
  
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
      render json: @user
    else
      render json: { errors: @user.errors}, status: 400
    end
  end

  def potentials
    @jobs = @user.potential_jobs
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, { common_app_attributes: [:resume] } )
  end

  def correct_user 
    @user = User.for_profile.find(params[:id])
    redirect_to current_user unless current_user?(@user) || current_user.admin?
  end

  def load_data
    @common_app = @user.common_app
    @applications = @user.applications
    @video = @user.video
  end
end