module BooksHelper
	def get_username_from_book_id(book_id)
		book = Book.find_by(_id: book_id)
		user = User.find_by(_id: book.user_id)
		username = user.name		
	end
end
