module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def redirect_back_or(default) # this creates friendly forwarding for the app
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to '/signin', notice: "Please sign in."
    end
  end
  
  def correct_user
    @user = User.find(params[:user_id]) if params[:user_id] # For nested association
    @user = User.find(params[:id]) if @user.nil?  # For the rest 
    redirect_to current_user unless current_user?(@user) || current_user.admin? 
  end


  def has_job(user,current_job)
    if user.applications.any?
      user.applications.each do |application|
        return true if application.job_id = current_job.id 
      end
    end
    false
  end  
  
  def admin_user 
    redirect_to(current_user) unless current_user.admin? 
  end

end
