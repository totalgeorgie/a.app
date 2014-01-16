class Admin::UsersController < ApplicationController
  #rails g controller Admin::Users index 
  before_action :signed_in_user
  before_action :admin_user

  def index
    @cities = City.all
    @positions = Position.all

    @search = User.search do
      fulltext params[:search]
      facet(:city_ids)
      with(:city_ids, params[:city_id]) if params[:city_id].present? && params[:city_id] != "0"
      facet(:position_ids)
      with(:position_ids, params[:position_id]) if params[:position_id].present? && params[:position_id] != "0"
      paginate(page: params[:page], per_page: 20)
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
