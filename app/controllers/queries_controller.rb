class QueriesController < ApplicationController

	def index
	  messages = Query.where(receiver_id: session[:user_id])
	  @unread_messages = messages.unread	
	  @read_messages = messages.where(seen: true)
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
		  redirect_to books_path, :notice => "Your message was sent successfully!"
		else
		  render action: "new", :notice => @query.errors, status: :unprocessable_entity
		end
		session[:buying_book_id] = nil
	end

	def show
		@query = Query.find_by(_id: params[:id])
		@query.update_attributes(:seen => 'true')
	end

end