class CommonAppsController < ApplicationController
  before_action :signed_in_user

  def new
    if current_user.common_app.any?
      redirect_to current_user
    else
  		@common_app = current_user.common_app.new 
    end
  end

  def create 
  	@common_app = current_user.common_app.build(common_app_params)
  	if @common_app.save
  		flash[:success] = "Common App Created!"
  		redirect_to root_url
  	else
  		redirect_to 'common_apps/new'
  	end
  end

  def show
    @common_apps = current_user.common_app
  end

  #for show, edit, we need to make sure that they can only see 1 common_app 

  private

    def common_app_params
      params.require(:common_app).permit(:current_city,:grad_year,:read_type,
      									  :listen_speak,:time_in_china,
      									  :cover_letter,:resume)####fill in the correct ones here
    end

end
