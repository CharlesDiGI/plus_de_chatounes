class Cart < ApplicationRecord
	belongs_to :user
	
	has_many :join_table_cart_items
	has_many :items, through: :join_table_cart_items
	#has_many :good_orders

	def to_param
		permalink
	end

  def permalink
  	"my_cart"
	end

end

