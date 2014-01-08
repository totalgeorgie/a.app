class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :destroy] # only admins can see admin dashboard
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy] # makes sure that the user is signed in to access these pages
  before_action :correct_user, only: [:edit, :update, :show] # makes sure that the user can only edit and see their own info

  def new
    redirect_to current_user if current_user
    @user = User.new
  end

  def create 
  	@user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Atlas China, You're almost there, fill in your general application!"
      redirect_to new_common_app_path
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show 
  end

  def index 
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url 
  end 


  private

    def user_params # this is used in order to restrict what params a person can pass to the controller. i.e otherwise people might pass a parameter for admin=1
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
