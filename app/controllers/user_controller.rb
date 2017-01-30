class UserController < ApplicationController

	def me
		render json: current_user, status: 200
	end

end
