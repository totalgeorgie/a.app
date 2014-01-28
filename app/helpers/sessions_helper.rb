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
    @user ||= User.find(params[:id])
    redirect_to current_user unless current_user?(@user) || current_user.admin? 
  end

  def root_path_helper
    if signed_in? 
      current_user.admin ? admin_path : current_user
    else
      root_path
    end
  end
  
  def has_job(user,current_job)
    user.applications.any? ? user.applications.any?{ |app| app.job == current_job } : false
  end  
  
  def admin_user 
    redirect_to root_path unless current_user.admin? 
  end

  def sort_user_column
    User.column_names.concat(["grad_year"]).include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_job_column
    Job.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sortable_user(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_user_column ? "current #{sort_direction}" : nil
    direction = column == sort_user_column && sort_direction == "desc" ? "asc" : "desc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def sortable_job(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_job_column ? "current #{sort_direction}" : nil
    direction = column == sort_job_column && sort_direction == "desc" ? "asc" : "desc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
end
