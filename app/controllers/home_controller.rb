class HomeController < ApplicationController	
  def index
  	if current_user  		
  		@messages = Query.where(receiver_id: session[:user_id])  		
  		@unread_messages = @messages.where(seen: 'false')		
  	end
  end
end
