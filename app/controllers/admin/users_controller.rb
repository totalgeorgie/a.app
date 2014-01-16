class Admin::UsersController < ApplicationController
  #rails g controller Admin::Users index 
  before_action :signed_in_user
  before_action :admin_user

  def index
    @cities = City.all
    @positions = Position.all
    @search = User.search do
      fulltext params[:search]
    end
    @users = @search.results
    @jobs = Job.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url 
  end

end
