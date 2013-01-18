module QueriesHelper
	def has_unread_responses?(message)
	  unread = if message.responses.where(seen: false).count > 0
	  	true
	  elsif message.responses.where(seen: false).count === 0
	  	false
	  else
	  	false
	  end
	  return unread
	end
end
