module ItemsHelper
	def is_kitty?(item)
		if item.category == Category.find(1)
			true
		else
			false
		end
	end

	def is_kibble?(item)
		if item.category == Category.find(2)
			true
		else
			false
		end
	end
end
