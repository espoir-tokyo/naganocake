class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.all
	end

	def update
		@order = Order.find(params[:id])
			@order_item = OrderItem.find
			redirect_to admins_order_path(@order), notice: "successfully updated!"
		else
			redirect_to admins_orders_path
		end
	end

	after_update do
		change_order_status if order_status_changed?


	def destroy
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
    )
    end

end
