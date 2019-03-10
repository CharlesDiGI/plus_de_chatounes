module ItemsHelper
	def is_kitty?(item)
		if item.category == Category.first
			true
		else
			false
		end
	end

	def is_kibble?(item)
		if item.category == Category.last
			true
		else
			false
		end
	end
end
