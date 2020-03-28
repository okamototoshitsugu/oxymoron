class Users::SubTasksController < ApplicationController
	def create
		@sub_task = SubTask.new(sub_task_params)
		@sub_task.user_id = current_user.id
		if @sub_task.save
			redirect_to users_tasks_path
		else
		end
	end

	def edit
		@sub_task = SubTask.find(params[:id])
	end

	def update
		@sub_task = SubTask.find(params[:id])
		@sub_task.update(sub_task_params)
		redirect_to users_tasks_path
	end

	def destroy
		@sub_task = SubTask.find(params[:id])
		@sub_task.destroy
		redirect_to users_tasks_path
	end

	def sub_task_params
		params.require(:sub_task).permit(:title, :memo, :start_date_time, :end_date_time, :important_status, :task_id, :location)
	end
end