class Admin::UsersController < ApplicationController
  #rails g controller Admin::Users index 
  before_action :signed_in_user
  before_action :admin_user

  def index
  end

end
