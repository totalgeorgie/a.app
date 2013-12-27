class VideosController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user, only: [:edit, :update, :show]
  
  def new
    if current_user.video
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
        render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @video = @user.video
    redirect_to new_video_path, notice: "Looks like you haven't made your video yet! Fill it in below." unless @video.present?
  end   


  def update
    @user = User.find(params[:id])
    @video = @user.video
    if @user.video.update_attributes(video_params)
      flash[:success] = "Video App Updated!"
      redirect_to video_url
    else
      render :edit
    end
  end

  def edit
    @video = current_user.video
  end

  private
  
    def video_params
      params.require(:video).permit(:video_cid,:question)
    end

end
