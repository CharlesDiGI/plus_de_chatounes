module CartsHelper
	def sum(cart)
		sum = 0
		cart.items.each do |item|
			sum += item.price
		end
		return sum
	end
end
