class VideosController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user

  # NOTE TEST EVERY SINGLE ACTION HERE! JUST MADE AN UPDATE THAT SHOULD FIX ANY ADMIN ISSUES
  
  def new
    if @user.video
      redirect_to @user
    else
      @video = @user.build_video
    end
  end

  def create 
    @video = @user.build_video(video_params)
    @video.video_cid = params[:AtlasApp][:video_uuid] 
    if @video.save
        flash[:success] = "Video Created!"
        redirect_to @user
    else
        render :new
    end
  end

  def show
    @video = @user.video
    redirect_to new_video_path, notice: "Looks like you haven't made your video yet! Fill it in below." unless @video.present?
  end   


  def update
    @video = @user.video
    @video.video_cid = params[:AtlasApp][:video_uuid]

    if @video.update_attributes(video_params)
        flash[:success] = "Video Updated!"
        redirect_to root_url
    else
        render :new
    end
  end

  def edit
    @video = @user.video
  end

  private
  
    def video_params
      params.require(:video).permit(:video_cid,:question, :AtlasApp => [:video_uuid])
    end

end
