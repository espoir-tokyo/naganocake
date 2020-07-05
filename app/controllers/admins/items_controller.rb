class Admins::ItemsController < ApplicationController
	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save!
			redirect_to admins_items_path, notice: "successfully created book!"
			# リダイレクト先はあとで変更
		else
			redirect_to about_path
			# リダイレクト先はあとで変更
		end
	end

	def index
		@items = Item.all
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to admins_items_path, notice: "successfully updated book!"
		else
			redirect_to about_path
		end
	end

	private
	def item_params
	  params.require(:item).permit(:name, :image, :description, :genre_id, :price, :sale_status)
    end
end
