class VideosController < ApplicationController
  before_action :signed_in_user
  
  def new
    if current_user.video.present?
      redirect_to current_user
    else
      @video = current_user.build_video
    end
  end

  def create 
  	@video = current_user.build_video(video_params)
  	if @video.save
  		flash[:success] = "Video Created!"
  		redirect_to root_url
  	else
  		redirect_to new_video_path
  	end
  end


  private
  
    def video_params
      params.require(:video).permit(:video_cid,:question)
    end
end
