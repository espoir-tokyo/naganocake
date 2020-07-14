class Admins::CustomersController < ApplicationController
	def index
		@customers = Customer.with_deleted.page(params[:page]).per(10)
	end

	def show
		@customer = Customer.with_deleted.find(params[:id])
	end

	def edit
		@customer = Customer.with_deleted.find(params[:id])
	end

	def update
		customer = Customer.with_deleted.find(params[:id])
		if params[:customer][:status] == "true"
			customer.restore
		else
			customer.destroy
		end
		customer.update(customer_params)
		redirect_to admins_customer_path(customer.id)
	end

	def destroy
	end

	private
	def customer_params
		params.require(:customer).permit(
			:surname, :first_name, :surname_kana, :first_name_kana,
			:postal_code, :address, :phone_number, :email)
	end
end
