class HomeController < ApplicationController	
  def index
  	if current_user  		
  		# @messages = Query.where(receiver_id: session[:user_id]) 
  		# @responses = Response.where(receiver_id: session[:user_id])
  		# @unread_responses = @responses.where(seen: 'false').count 		
  		# @unread_messages = @messages.where(seen: 'false').count
  		# @unread_count = @unread_responses + @unread_messages
  		# @books = Book.where(sold: false)
      # @unread = Query.where(receiver_id: session[:user_id], seen: false)
  		redirect_to books_path
  	end
  end
end
