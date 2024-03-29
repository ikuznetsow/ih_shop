class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
  	if session[:user_id]
			@current_user ||= User.find(session[:user_id])
		end
  end

  def authorize
  	if current_user
  	else
  		redirect_to root_url
  	end
  end

end
