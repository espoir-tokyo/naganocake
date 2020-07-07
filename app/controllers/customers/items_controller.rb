class Customers::ItemsController < ApplicationController
	def index
		@items = Item.where(sale_status: 'true')
		@genres = Genre.where(flag: 'true')
	end

	def show
		@item = Item.find(params[:id])
		@genres = Genre.where(flag: 'true')
	end

	def genre_index
		@genre = Genre.find(params[:id])
		@items = Item.where(sale_status: 'true', genre_id: @genre.id)
		@genres = Genre.where(flag: 'true')
	end
end
