class Item < ApplicationRecord
	# VALIDATES
	validates :title, presence: true
	validates :description, presence: true, length: { in: 5..100 }
	validates :price, presence: true, numericality: { greater_than: 0 }
	validates :image, presence: true

	has_many :join_table_cart_items
	has_many :carts, through: :join_table_cart_items

	has_many :order_items
	has_many :orders, through: :order_items

	has_one_attached :image

	belongs_to :category
end
