class Item < ApplicationRecord
	attachment :image
	belongs_to :genre
	has_many :cart_items
	validates :name, presence: true
	validates :description, presence: true
	validates :genre_id, presence: true
	validates :price, presence: true
	validates :sale_status, presence: true
end
