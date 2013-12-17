class VideosController < ApplicationController
  before_action :signed_in_user
  
  def new
    if current_user.video.present?
      redirect_to current_user
    else
      @video = current_user.build_video
    end
  end

end
