class Item < ApplicationRecord
	attachment :image
	belongs_to :genre
	validates :name, presence: true, length: {minimum: 1}
	# validates :sale_status, inclusion: { in: ["true", "false"]}
end
