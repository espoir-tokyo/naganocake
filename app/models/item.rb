class Item < ApplicationRecord
	attachment :image
	belongs_to :genre
	validates :name, presence: true
	validates :description, presence: true
	validates :genre_id, presence: true
	validates :price, presence: true
	validates :sale_status, inclusion:{in: [true, false]}

	def price_with_tax
		self.price = (price * 1.08).round
	end
end
