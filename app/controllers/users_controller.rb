class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :destroy] # only admins can see admin dashboard
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy] # makes sure that the user is signed in to access these pages
  before_action :correct_user, only: [:edit, :update, :show] # makes sure that the user can only edit and see their own info

  def new
    if current_user
      redirect_to current_user
    else
    	@user = User.new
    end
  end

  def create 
  	@user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Atlas China!"
      redirect_to @user
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
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user) unless current_user?(@user)
    end

    def admin_user 
      redirect_to(current_user) unless current_user.admin? 
    end
end
