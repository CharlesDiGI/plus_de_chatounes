class Item < ApplicationRecord
	# VALIDATES
	validates :title, presence: true
	validates :description, presence: true, length { in: 5..40 }
	validates :price, presence: true, numericality: { greater_than: 0 }
	validates :image_url, presence: true
end
