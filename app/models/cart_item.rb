class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :item, optional: true

	validates :quantity, presence: true

end
