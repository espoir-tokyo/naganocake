class HomesController < ApplicationController
	def top
		@genres = Genre.all
		@random = Item.order("RANDOM()").where(sale_status: 'true').limit(4)
	end

	def about
	end
end
