class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user

	def logged_in?
        if !session[:user_id]
          print("user is not logged in")
          redirect_to sign_in_path
        end
    end

	def current_user
	    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
