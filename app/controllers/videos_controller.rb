class VideosController < ApplicationController
  before_action :signed_in_user

  def new
    current_user.video ? redirect_to(current_user) : false
    @video = current_user.build_video
  end

  def create 
    @video = current_user.build_video(video_params)
    if @video.save
      render json: @video
    else
      render json: { errors: @video.errors }, status: 400
    end
  end
  
  def update
    @video = current_user.video
    if @video.update_attributes(video_params)
      render json: @video
    else
      render json: { errors: @video.errors }, status: 400
    end
  end

  private
  def video_params
    params.require(:video).permit(:video_uuid)
  end
end