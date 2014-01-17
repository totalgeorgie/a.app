class Admin::UsersController < ApplicationController
  #rails g controller Admin::Users index 
  before_action :signed_in_user
  before_action :admin_user
  
  def index
    @cities = City.all
    @positions = Position.all

    @city = City.find(params[:city_id]) if params[:city_id] && params[:city_id] != "0" && params[:city_id] != "" 
    @position = Position.find(params[:position_id]) if (params[:position_id] && params[:position_id] != "0") && params[:position_id] != ""
    
    @users = User.all
    @users = @users.includes(:cities).where(cities: { id: @city }) if @city
    @users = @users.includes(:positions).where(positions: { id: @position }) if @position
    @users = @users.find(:all, :conditions => ['users.name LIKE ?', "%#{params[:search]}%"]) if params[:search]
    @users = @users.paginate(page: params[:page], per_page: 20)

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url 
  end

end