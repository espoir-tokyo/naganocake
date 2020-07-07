module Admins::ItemsHelper
	def to_yen(money)
		"#{money}円"
	end

	def addTax(money,rate)
		taxed_money = (money*rate).round
		"税込#{taxed_money}円"
	end

	def display(status)
		if status == true
			"販売中"
		else
			"販売停止中"
		end
	end
end
