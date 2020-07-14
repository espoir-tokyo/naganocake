class Customers::ItemsController < ApplicationController
	def index
		@items = Item.where(sale_status: 'true').page(params[:page]).per(12)
		@genres = Genre.where(flag: 'true')
		# @items = Item.all.page(params[:page]).per(12)
	end

	def show
		@item = Item.find(params[:id])
		@genres = Genre.where(flag: 'true')
		@cart_item = CartItem.new
	end

	def genre_index
		@genre = Genre.find(params[:id])
		@items = Item.where(sale_status: 'true', genre_id: @genre.id).page(params[:page]).per(12)
		@genres = Genre.where(flag: 'true')
	end
end
