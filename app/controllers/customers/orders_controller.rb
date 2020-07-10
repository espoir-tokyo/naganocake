class Customers::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
	end
	def create
		@order = Order.new(order_params)
		order.customer_id = customer.id
		@order.save
		redirect_to customers_orders
	end
    def confirm
    	@order = Order.new(order_params)
    	if @order.payment_informantion == 0 then
    	 @value = "クレジットカード"
    	elsif @order.payment_informantion == 1 then
         @value = "銀行振込"
    	end
    end

 private
  def order_params
    params.require(:order).permit(:address_number, :customer_id, :ship_address, :ship_name, :bill, :carriage, :payment_informantion, :order_status)
  end

end
