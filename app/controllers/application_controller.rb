class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  private

  def current_user  	
    @current_user ||= User.find_by(_id: session[:user_id]) if session[:user_id]   
  end
  helper_method :current_user
end