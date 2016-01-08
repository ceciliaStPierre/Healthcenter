module UsersHelper
	def getMessageHtml(message)
		m = message.sender.firstname+" "+message.sender.father_lastname+": "+message.body
		return m.html_safe
	end
end
