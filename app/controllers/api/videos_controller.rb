class Api::VideosController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: [:create, :update]

  def create 
    @video = @user.build_video(video_params)
    if @video.save
      render json: @video
    else
      render json: { errors: @video.errors }, status: 400
    end
  end
  
  def update
    @video = @user.video
    if @video.update_attributes(video_params)
      render json: @video
    else
      render json: { errors: @video.errors }, status: 400
    end
  end

  private
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to current_user unless current_user?(@user) || current_user.admin
  end

  def video_params
    params.require(:video).permit(:video_uuid, :question_choice)
  end
end