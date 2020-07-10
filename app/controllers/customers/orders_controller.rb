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

    if params[:address_number] == "0" then
     @order.ship_postal_code = current_customer.postal_code
     @order.ship_address = current_customer.address
     @order.ship_name = current_customer.surname + current_customer.first_name

    elsif params[:address_number] == "1" then
      registered_address = ShippingAddress.find(params[:order][:shipping_addresses_id])
      @order.ship_postal_code = registered_address.postal_code
      @order.ship_address = registered_address.address
      @order.ship_name = registered_address.name

    elsif params[:address_number] == "2" then
      
    end
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
      :payment_informantion,
      :order_status,
    )
  end

end
