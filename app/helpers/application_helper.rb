module ApplicationHelper
	def get_username_from_id(id)
		user = User.find_by(_id: id)
		username = user.name
	end

	def get_imgurl_from_id(id)
		user = User.find_by(_id: id)
		img_url = user.picture_url
	end

	def get_book_from_id(id)
		book = Book.find_by(_id: id)
		name = book.title
	end

	def has_unread_response?(query)
		if query.responses.count > 0 && query.responses.last.seen = false		
			true
		end
	end
end
