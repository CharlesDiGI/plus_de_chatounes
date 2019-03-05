class GoodOrder < ApplicationRecord
	belongs_to :user
	belongs_to :cart
	

end
