class VideosController < ApplicationController
  before_action :signed_in_user

  def new
    current_user.video ? redirect_to(current_user) : false
    @video = current_user.build_video
  end

  def create 
    @video = current_user.build_video(video_params)
    if @video.save
      flash[:success] = "Video successfully added"
      redirect_to current_user
    else
      render :new
    end
  end

  def edit
    @video = current_user.video
  end
  
  def update
    @video = current_user.video
    if @video.update_attributes(video_params)
      flash[:success] = "Video successfully updated"
      redirect_to current_user
    else
      render :edit
    end
  end

  private
  def video_params
    params.require(:video).permit(:video_uuid)
  end
end
