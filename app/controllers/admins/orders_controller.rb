class Admins::OrdersController < ApplicationController

	def index
		@orders = Order.all
		@orders = Order.order(created_at: :desc)
	end

	def show
	end

	def create
	end

	def update
	end
end
