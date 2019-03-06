module UsersHelper
	def logged_in?
  	if !current_user.nil?
  		true
  	else
  		false
  	end
  end
end
