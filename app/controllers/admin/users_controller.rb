class Admin::UsersController < ApplicationController
  #rails g controller Admin::Users index 
  respond_to :html, :json
  before_action :signed_in_user
  before_action :admin_user
  
  def index
    @cities = City.all
    @positions = Position.all
    @users = User.search(params)
    if sort_user_column == "grad_year"
      @users = @users.joins(:common_app).order("common_apps.grad_year" + " " + sort_direction)
    else 
      @users = @users.order(sort_user_column + " " + sort_direction)
    end
    @users = @users.paginate(page: params[:page], per_page: 20)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted."
    redirect_to users_url 
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      respond_to do |format|
        format.html { redirect_to admin_user_path(@user), :notice => "Changes Updated" }
        format.json { render json: {success: true} }
      end
    else
      respond_to do |format|
        format.html { render :action => "show", :notice => "There was an error, please try again" }
        format.json {render json: {errors: @user.errors}, status: 400 }
      end
    end
  end


  def show
    @user = User.find(params[:id])
    @common_app = @user.common_app
    @application = Application.new
  end

private
    def user_params # this is used in order to restrict what params a person can pass to the controller. i.e otherwise people might pass a parameter for admin=1
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :heat_id, :admin_note)
    end  

end