class Customers::CustomersController < ApplicationController

	def show
		@customer = current_customer
	end

	def edit
		@customer = current_customer
	end

	def update
		@customer = current_customer
		@customer.update(customer_params)
		redirect_to customers_profile_path, notice: "編集が完了しました。"
	end

	def confirm
	end

	def destroy
		current_customer.destroy
		sign_out_and_redirect(current_customer)
	end



	private
def customer_params
  params.require(:customer).permit(:surname, :first_name, :surname_kana, :first_name_kana, :postal_code, :address, :phone_number)
end
end
