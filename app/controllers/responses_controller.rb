class ResponsesController < ApplicationController
	def new
	  @response = Response.new
	end

	def create
	  query = Query.find_by(_id: params[:query_id])
	  response = query.responses.new
	  response.body = params[:response][:body]
	  response.sender_id = query.receiver_id
	  response.receiver_id = query.sender_id
	  response.seen = false

	  if response.save!
	    redirect_to query_path(query), :notice => "Your message was sent successfully!"
	  else
	    render action: "new", :notice => response.errors, status: :unprocessable_entity
	  end	  
	end
end
