class CommonAppsController < ApplicationController
  before_action :signed_in_user

  def new
    if current_user.common_app.present?
      redirect_to current_user
    else
      @common_app = current_user.build_common_app
    end
  end

  def create 
  	@common_app = current_user.build_common_app(common_app_params)
  	if @common_app.save
  		flash[:success] = "Common App Created!"
  		redirect_to root_url
  	else
  		redirect_to 'common_apps/new'
  	end
  end

  def update
    if current_user.common_app.update_attributes(common_app_params)
      flash[:success] = "Common App Updated"
      redirect_to root_url
    else
      render 'common_apps/edit'
    end
  end

  def show
    @common_app = current_user.common_app
  end

  def edit
    @common_app = current_user.common_app
  end

  private
  
    def common_app_params
      params.require(:common_app).permit(:current_city,:grad_year,:read_type,
      									  :listen_speak,:time_in_china,
      									  :cover_letter,:resume) ####fill in the correct ones here
    end

end
