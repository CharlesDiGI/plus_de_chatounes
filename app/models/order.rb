class Order < ApplicationRecord

	belongs_to :user
	#belongs_to :cart
	has_many :order_items
	has_many :items, through: :order_items

end
