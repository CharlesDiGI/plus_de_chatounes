class Order < ApplicationRecord
	after_create :order_recap, :inform_admin

	belongs_to :user
	#belongs_to :cart
	has_many :order_items
	has_many :items, through: :order_items

	def order_recap
		OrderMailer.order_recap(self).deliver_now	
	end

	def inform_admin
		OrderMailer.inform_admin(self).deliver_now	
	end

end
