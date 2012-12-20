class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])    
    session[:user_id] = user._id
    puts params[:reg_no]
    # session[:reg_no] = params[:reg_no]
    redirect_to root_url
  end

  def set  	
    puts params[:reg_no]
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
