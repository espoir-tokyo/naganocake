class HomesController < ApplicationController
	def top
		@genres = Genre.where(flag: 'true')
		@random = Item.order("RANDOM()").where(sale_status: 'true').limit(4)
	end

	def about
	end
end
