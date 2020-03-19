class Users::BookmarksController < ApplicationController
	before_action :set_variables
  def index
  end
  def create
    @task = Task.find(params[:task_id])
    bookmark = @task.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @task = Taks.find(params[:task_id])
    bookmark = current_user.bookmarks.find_by(task_id: @task.id)
    bookmark.destroy
  end

  private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to users_tasks_path
    when 1
      redirect_to users_tasks_path(@task)
    end
  end
end
