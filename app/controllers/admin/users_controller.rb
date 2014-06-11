class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :load_data, only: [:new, :create]
  respond_to :html, :json

  def index
    @users = User.admin_search(params)
  end

  def new
    @new_user = User.new
  end
  
  def create
    @new_user = User.new(user_params).generate_email.generate_pass

    if @new_user.save
      flash[:success] = "User created!"
      redirect_to admin_user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @application = Application.new(user_id: @user.id)
    @jobs = Job.all.collect { |job| [job.job_title, job.id] }
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
        :admin_note,
        :password,
        :admin_note,
        :sourced,
        
        common_app_attributes: [
          :resume,
          :grad_year,
          :current_city,
          industry_ids: [],
          role_type_ids: [],
          city_ids: []
        ],
        
        extra_info_attributes: [
          :linkedin_url, 
          :source_place, 
          :objective,
          :experience_1,
          :experience_2,
          :education,
          :other,
          :user_id
        ]
      )
  end

  def load_data
    @industries = Industry.all.collect { |industry| [industry.name, industry.id] }
    @cities = City.all.collect { |city| [city.name, city.id] }
    @role_types = RoleType.all.collect { |role_type| [role_type.name, role_type.id] }
  end
end