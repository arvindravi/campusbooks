class QueriesController < ApplicationController

	def index
	  @user = User.find_by(_id: session[:user_id])
	  @messages = Query.where(receiver_id: @user._id).desc(:created_at).paginate(:page => params[:page], :per_page => 4) || Response.where(receiver_id: @user._id)
	  @sentmessages = Query.where(sender_id: @user._id).desc(:created_at).paginate(:page => params[:page], :per_page => 4)
	end

	def new		
		@query = Query.new
		@book = Book.find_by(_id: session[:buying_book_id])
		@user = User.find_by(_id: @book.user_id)
	end

	def create	
		@query = Query.new(params[:query])
		book_id = session[:buying_book_id]	
		sender = User.find_by(_id: session[:user_id])
		book = Book.find_by(_id: book_id)	
		
		@query.book_id = book._id
		@query.receiver_id = book.user_id
		@query.sender_id = sender._id
		@query.body = params[:query][:body]
		@query.seen = false

		if @query.save!
		  redirect_to query_path(@query), :notice => "Your message was sent successfully!"
		else
		  render action: "new", :notice => @query.errors, status: :unprocessable_entity
		end
		session[:buying_book_id] = nil
	end

	def show
		# @user = User.find_by(_id: session[:user_id])
		# @query = Query.find_by(_id: params[:id])	
		# @book = Book.find_by(_id: @query.book_id)
		# @query.update_attribute(:seen,true)
		# @query.responses.last.update_attribute(:seen,true) if @query.responses.count > 0
		# @response = @query.responses.new
		@query = Query.find_by(_id: params[:id])
		@user = User.find_by(_id: @query.sender_id)
		if session[:user_id] === @query.receiver_id
		  @query.update_attribute(:seen,true)
		  @query.responses.update_all(seen: true)
		end	
		@book  = Book.find_by(_id: @query.book_id)
		# @response = @query.responses.new
	end

end
