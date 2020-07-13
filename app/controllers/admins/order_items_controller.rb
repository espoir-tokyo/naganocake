class Admins::OrderItemsController < ApplicationController
	def update
		@order = params[:order_item][:order_id]
		@order_item = OrderItem.find(params[:id])
		if @order_item.update(order_item_params)
			redirect_to admins_order_path(@order), notice: "successfully updated!"
		else
			redirect_to admins_orders_path
		end
	end

	private
	def order_item_params
		params.require(:order_item).permit(:item_status)
	end
end
