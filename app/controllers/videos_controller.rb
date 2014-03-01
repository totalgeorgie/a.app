class VideosController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user
  before_action :correct_video, only: [:show]

  def new
    if @user.video
      redirect_to edit_user_video_path(@user, @user.video), 
        :notice => "You already created your video. Submit this form to replace your video"
    else
      @video = @user.build_video
    end
  end

  def create 
    @video = @user.build_video(video_params)
    if @video.save
        flash[:success] = "Video Created!"
        redirect_to @user
    else
        render :new
    end
  end

  def show
    redirect_to new_user_video_path(@user), 
      notice: "Looks like you haven't made your video yet! Fill it in below." unless @video.present?
  end   


  def update
    @video = @user.video
    if @video.update_attributes(video_params)
        flash[:success] = "Video Updated!"
        redirect_to @user
    else
        render :new
    end
  end

  def edit
    @video = @user.video
  end

  private
    def correct_video
      @video = Video.find(params[:id])
      unless current_user.video == @video || current_user.admin? 
        redirect_to user_video_path(current_user, current_user.video)
      end
    end

    def video_params
      params.require(:video).permit(:video_uuid)
    end
end
