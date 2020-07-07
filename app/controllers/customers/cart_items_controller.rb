class Customers::CartItemsController < ApplicationController
	def index
		@cart_items = current_customer.cart_items
	end

	def create
		# @cart_item = CartItem.new(item_params)
		# @cart_item.customer_id = current_customer.id
		# @cart_item.price = @cart_item.items.price * @cart_item.quantity
		# @cart_item.save
		# redirect_to cart_items_path
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to cart_items_path
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		@cart_items = current_customer.cart_items
		@cart_item.destroy_all
		redirect_to cart_items_path
	end

	private
	def item_params
		params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
	end
end
