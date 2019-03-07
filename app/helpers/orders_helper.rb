module OrdersHelper
	def sum_order(order)
		sum = 0
		order.order_items.each do |item|
			sum += item.item.price
		end
		return sum
	end
end
