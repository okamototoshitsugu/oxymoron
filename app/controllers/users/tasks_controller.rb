class Users::TasksController < ApplicationController
	before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]
	def index
		@tasks = Task.all
		@tasks = Task.order("start_date_time")
		@tasks = current_user.tasks
		@task = Task.new
		@sub_task = SubTask.new
		@user = current_user
		gon.tasks = @tasks
	end

	def create
		@task = Task.new(task_params)
		@task.user_id = current_user.id

		if @task.save
			redirect_to users_tasks_path
		else
			flash[:notice] ="※※※タイトルを入力して下さい※※※"
		end
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		@task.update(task_params)
		redirect_to users_tasks_path
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to users_tasks_path
	end

	def task_params
		params.require(:task).permit(:title, :memo, :start_date_time, :end_date_time, :important_status, :location)
	end
end
