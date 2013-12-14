class CommonAppsController < ApplicationController
  before_action :signed_in_user

  def new
  	@common_app = current_user.common_app.new ## not working, why?

  end

  def create 
  	@common_app = current_user.common_app.build(common_app_params)
  	if @common_app.save
  		flash[:success] = "Common App Created!"
  		redirect_to root_url
  	else
  		redirect_to 'new'
  	end
  end

  def create
  end

  private

    def common_app_params
      params.require(:common_app).permit(:current_city,:grad_year,:read_type,
      									  :listen_speak,:time_in_china,
      									  :cover_letter,:resume)####fill in the correct ones here
    end

end
