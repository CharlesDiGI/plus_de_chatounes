module UsersHelper
	def logged_in?
  		if !current_user.nil?
  			true
  		else
  			false
  		end
	end

	def is_admin?
		unless !current_user.nil? && current_user.is_admin?
		  flash[:danger] = "Il semble que tu n'es pas administrateur du site, tu ne peux pas accéder à cette page."
		  redirect_back(fallback_location: root_path)
		end
	end

	def admin_navbar?
		if !current_user.nil? && current_user.is_admin?
			true
		else
			false
		end
	end
end
