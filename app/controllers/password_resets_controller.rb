class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:success] = "If this is the correct email we would have sent you a confirmation email."
    redirect_to root_url
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    
    if @user.password_reset_sent_at < 5.days.ago
      redirect_to new_password_reset_path, :alert => "This link has expired."
    elsif @user.update_attributes(pass_reset_params)
      redirect_to signin_path, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

  private
  def pass_reset_params 
    params.require(:user).permit(:password, :password_confirmation)
  end
end