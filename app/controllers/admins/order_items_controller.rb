class Admins::OrderItemsController < ApplicationController
	def update
		order = params[:order_item][:order_id]
		@order_item = OrderItem.find(params[:id])
		@order_item.update(order_item_params)
		if params[:order_item][:item_status] == “2”
			@order_item.order.update(order_status: “2”)
		elsif @order_item.order.order_items.count == @order_item.order.order_items.where(item_status: “3”).count
			@order_item.order.update(order_status: “3”)
		end
		redirect_to admins_order_path(order), notice: “successfully updated!”
	end

	private
	def order_item_params
		params.require(:order_item).permit(:item_status)
	end
end
