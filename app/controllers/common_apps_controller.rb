class CommonAppsController < ApplicationController
  respond_to :html, :json
  before_action :signed_in_user
  before_action :correct_user
  before_action :correct_common_app, only: [:show]

  def new
  end

  def create 
  end

  def edit
    @industries = Industry.all
    @common_app = @user.common_app
  end

  def update
    @common_app = CommonApp.find(params[:id])
    if @common_app.update_attributes(common_app_params)
      respond_to do |format|
        format.html { render :action => "show" }
        format.json { render json: {success: true, progress_value: @common_app.user.progress, user_name: @common_app.user.name } }
      end
    else
       render json: {errors: @common_app.errors}, status: 400
    end
  end

  def show
    redirect_to new_user_common_app_path(@user), notice: "Looks like you haven't made your common application. Fill it in below." unless @common_app.present?
  end    

  private

    def correct_common_app
      @common_app = CommonApp.find(params[:id])
      redirect_to common_app_path(current_user.common_app) unless current_user.common_app == @common_app || current_user.admin? 
    end
    
    def common_app_params
      params.require(:common_app).permit(:current_city,:grad_year,:read_type,
      									  :listen_speak,:time_in_china,
      									  :cover_letter,:resume, industry_ids: [], city_ids: [], position_ids: [])
    end

end
