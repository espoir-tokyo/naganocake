class Customers::OrdersController < ApplicationController

	def new
		@order = Order.new
		@customer = current_customer
	end

	def create
        @order = Order.new(order_params)
        @order.save
        #ここから下カートitem
        current_customer.cart_items.each do |cart_item|
        order_item = OrderItem.new(
          order_id: @order.id,
        	item_id: cart_item.item.id,
        	quantity: cart_item.quantity,
        	perchase_price: cart_item.item.price,
        	 )
        order_item.save
        end
        current_customer.cart_items.destroy_all
        redirect_to customers_orders_thanks_path
	end

  def confirm
  	@order = Order.new(order_params)
  	@customer = current_customer
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
    @cart_items = CartItem.all
		@total = 0
		current_customer.cart_items.each do |cart_item|
			price = cart_item.item.price_with_tax
			quantity = cart_item.quantity
			@total += price * quantity
		end
	@carriage = "800".to_i
	@bill = @carriage + @total
  end

  def thanks
  	
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
