module Admins::GenresHelper
	def display(status)
		if status == true
			"有効"
		else
			"無効"
		end
	end
end
