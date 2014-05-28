class SecretKeysController < ApplicationController
  before_action :admin_user
  
  def show
    @key = SecretKey.find(params[:id])
  end

  def create
    @key = SecretKey.generate_key!
    flash[:success] = "Send the link below and the client will be able to create a job!"
    redirect_to secret_key_url(@key)
  end

  private
  def key_params
    params.require(:key).permit(:code)
  end

  def valid_key_holder
    @key = SecretKey.find(code: params[:code])
    redirect_to root_url unless @key && @key.valid?
  end
end
