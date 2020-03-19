class Users::GraphsController < ApplicationController
	def show
		@user = current_user
		@tasks = Task.where(important_status: 1,)
		p @tasks.count
		@tasks = Task.where(important_status: 2,)
		p @tasks.count
		@tasks = Task.where(important_status: 3,)
		p @tasks.count
		@tasks = Task.where(important_status: 4,)
		p @tasks.count
	end
end
