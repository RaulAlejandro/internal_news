class SessionsController < ApplicationController
  before_action :logged_in?, only: :destroy

  def new
  end

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
  end
end