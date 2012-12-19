module HomeHelper
	def get_username_from_id(id)
		user = User.find_by(_id: id)
		username = user.name
	end
end
