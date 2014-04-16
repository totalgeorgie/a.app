class ApplicationController < ActionController::Base
  before_action :expire_hsts
  protect_from_forgery with: :exception
  include SessionsHelper

  def xeditable? object = nil
    xeditable = params[:denied] ? false : true
    can?(:edit, object) and xeditable ? true : false
  end

  helper_method :xeditable?

  def can? edit, model
    true
  end

  private
  def expire_hsts
    response.headers['Strict-Transport-Security'] = 'max-age=0'
  end
end