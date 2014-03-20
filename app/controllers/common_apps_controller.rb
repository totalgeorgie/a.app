class CommonAppsController < ApplicationController
  before_action :signed_in_user

  def show
    @common_app = CommonApp.with_dependents.find_by_user_id(current_user.id)
    @user = current_user
  end 

  def update
    @common_app = CommonApp.with_dependents.find(params[:id])
    if @common_app.update_attributes(common_app_params)
      respond_to do |format|
        format.html { render :show }
        format.json { render json: { status: true, progress_value: current_user.progress, user_name: current_user.name } }
      end
    else
       render json: {errors: @common_app.errors}, status: 400
    end
  end   

  private    
  def common_app_params
    params.require(:common_app).permit(
      :current_city,
      :grad_year,
      :read_type,
      :listen_speak,:time_in_china,
    	:cover_letter,
      :resume, 
      industry_ids: [], 
      city_ids: [], 
      position_ids: [])
  end
end
