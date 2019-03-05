class Item < ApplicationRecord
	# VALIDATES
	validates :title, presence: true
	validates :description, presence: true, length: { in: 5..40 }
	validates :price, presence: true, numericality: { greater_than: 0 }
	validates :image_url, presence: true

	has_many :join_table_cart_items
	has_many :carts, through: :join_table_cart_items

	has_many :order_items
	has_many :orders, through: :order_items
end
