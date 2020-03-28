class Users::BookmarksController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def create
    @task = Task.find(params[:task_id])
    bookmark = @task.bookmarks.new(user_id: current_user.id)
    bookmark.save
  end

  def destroy
    @task = Task.find(params[:task_id])
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
