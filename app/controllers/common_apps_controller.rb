class CommonAppsController < ApplicationController
  before_action :signed_in_user 
  before_action :correct_applicant

  def show
    render json: @common_app
  end
  
  def update
    if @common_app.update_attributes(common_app_params)
      render json: @common_app
    else
      render json: { errors: @common_app.errors}, status: 400
    end
  end   

  private    
  def common_app_params
    params.require(:common_app).permit(
      :current_city,
      :grad_year,
      :resume,
      :china_time,
      :nationality,
      :ideal_salary,
      :chinese_ability,
      :bonus_question, 
      industry_ids: [], 
      city_ids: [], 
      position_ids: [])
  end

  def correct_applicant
    @common_app = CommonApp.with_dependents.find(params[:id])
    redirect_to root_url unless @common_app.user_id == current_user.id
  end
end