module CartsHelper
	def sum(cart)
		sum = 0
		cart.items.each do |item|
			sum += item.price
		end
		return sum
	end

	def not_empty?
		if @current_cart.items.length != 0
			true
		else
			false
		end
	end
end
