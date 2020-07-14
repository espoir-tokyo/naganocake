class Admins::HomesController < ApplicationController
	#before_action :authenticate_admins!
	def top
		today = Date.today.beginning_of_day..Date.today.end_of_day
		@order = Order.where(created_at: today)
	end
end
