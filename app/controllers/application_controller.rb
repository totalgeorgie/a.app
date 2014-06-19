class ApplicationController < ActionController::Base
  before_action :expire_hsts
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def expire_hsts
    response.headers['Strict-Transport-Security'] = 'max-age=0'
  end
end
