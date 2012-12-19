class HomeController < ApplicationController
  def index
  	if current_user
  		user = User.find_by(uid: session[:user_id])
  		@messages = Query.where(receiver_id: user._id)
  		@unread_messages = @messages.where(seen: 'false')  		
  	end
  end
end
