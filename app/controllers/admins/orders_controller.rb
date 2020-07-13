class Admins::OrdersController < ApplicationController
    def index
		@orders = Order.all
		@orders = Order.order(created_at: :desc)
	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.all
	end

	def update
		@order = Order.find(params[:id])
		if params[:order][:order_status] == "1"
			@order.order_items.each do |order_item|
				order_item.update(item_status: "1")
			end
		end
		# @order.order_items.each do |order_item|
		# 		order_item.item_status = "1"
		# 		order_item.save
		# 	end
		@order.update(order_params)
		redirect_to admins_order_path(@order), notice: "successfully updated!"
	end

	private
	def order_params
		params.require(:order).permit(
      :ship_postal_code,
      :address_number,
      :customer_id,
      :ship_address,
      :ship_name,
      :bill,
      :carriage,
      :order_status,
      :payment_informantion,
      :order_status,
      order_item:[:item_status]
    )
    end

end
