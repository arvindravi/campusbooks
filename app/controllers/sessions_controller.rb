class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"],session[:reg_no])    
    session[:user_id] = user._id
    redirect_to root_url
  end

  def set  	
    session[:reg_no] = params[:reg_no]
    redirect_to '/auth/facebook'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
