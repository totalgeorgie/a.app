class CommonAppsController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user
  
  # NOTE TEST EVERY SINGLE ACTION HERE! JUST MADE AN UPDATE THAT SHOULD FIX ANY ADMIN ISSUES
  
  def new
    if @user.common_app
      redirect_to @user
    else
      @common_app = @user.build_common_app
    end
  end

  def create 
  	@common_app = @user.build_common_app(common_app_params)
  	if @common_app.save
  		flash[:success] = "Common App Created. For the final step, record a video about one of the topics below"
  		redirect_to new_video_path
  	else
  		render :action => 'new'
  	end
  end

  def edit
    @common_app = @user.common_app
  end

  def update
    @common_app = CommonApp.find(params[:id])
    if @user.common_app.update_attributes(common_app_params)
      flash[:success] = "Common App Updated"
      redirect_to @user
    else
      render 'common_apps/edit'
    end
  end

  def show
    @common_app = @user.common_app
    redirect_to new_common_app_path, notice: "Looks like you haven't made your common application. Fill it in below." unless @common_app.present?
  end    

  private

    def common_app_params
      params.require(:common_app).permit(:current_city,:grad_year,:read_type,
      									  :listen_speak,:time_in_china,
      									  :cover_letter,:resume, industry_ids: [], city_ids: [], position_ids: [])
    end

end
