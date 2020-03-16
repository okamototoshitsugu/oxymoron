class Users::TasksController < ApplicationController
	def index
		@tasks = Task.all
		@task = Task.new
		@user = current_user
	end

	def show
	end

	def create
		@task = Task.new(task_params)
		@task.save
	end

	def update
	end

	def destroy
	end

	def task_params
		params.require(:task).permit(:title)
	end
end
