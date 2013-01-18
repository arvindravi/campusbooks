class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  private

  def notifications
  	unread_q = Query.where(receiver_id: session[:user_id], seen: false).count
  	unread_r = Response.where(receiver_id: session[:user_id], seen: false).count
  	return unread_r + unread_q
  end

  def current_user  	
    @current_user ||= User.find_by(_id: session[:user_id]) if session[:user_id]   
  end
  helper_method :current_user,:notifications
end