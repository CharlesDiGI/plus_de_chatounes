class JoinTableCartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :item
	belongs_to :good_order
end
