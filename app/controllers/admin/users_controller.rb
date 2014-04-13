class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :load_data, only: [:new, :create]
  respond_to :html, :json

  def index
    @users = User.search(params).paginate(page: params[:page], per_page: 30)
  end

  def new
    @new_user = User.new
  end
  
  def create
    @new_user = User.new(user_params)
    if @new_user.save
      flash[:success] = "User created!"
      redirect_to admin_users_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def reset_token
    @user = User.find(params[:id])
    @user.generate_password_reset
  end

  private
  def user_params
    params
      .require(:user)
      .permit(:name,
       :email,
       :password,
       :heat_id,
       :admin_note,
       :source_id,
       common_app_attributes: [:resume, :grad_year, :current_city, industry_ids: []])
  end

  def load_data
    @industries = Industry.all.collect { |industry| [industry.name, industry.id] }
  end
end