class Customers::CartItemsController < ApplicationController
	before_action :authenticate_customer!

	def index
		@cart_items = CartItem.all
		@total = 0
		current_customer.cart_items.each do |cart_item|
			price = cart_item.item.price_with_tax
			quantity = cart_item.quantity
			@total += price * quantity
		end
	end

	def create
		@cart_item = CartItem.new(item_params)
		@cart_item.customer_id = current_customer.id
		@cart_item.save
		redirect_to customers_cart_items_path
	end

	def update
		@cart_item = CartItem.find(params[:cart_item][:cart_item_id])
		@cart_item.update(item_params)
		redirect_to customers_cart_items_path
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to customers_cart_items_path
	end

	def destroy_all
		@cart_items = current_customer.cart_items
		@cart_items.destroy_all
		redirect_to customers_cart_items_path
	end

	private
	def item_params
		params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
	end
end
