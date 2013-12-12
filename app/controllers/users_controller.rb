class UsersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :update, :show] # makes sure that the user is signed in to access these pages
  before_action :correct_user, only: [:edit, :update, :show] # makes sure that the user can only edit and see their own info

  def new
  	@user = User.new
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
  end
  private

    def user_params # this is used in order to restrict what params a person can pass to the controller. i.e otherwise people might pass a parameter for admin=1
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user 
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
