class Users::UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@user.id = current_user.id
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to users_user_path(@user.id)
	end

	def destroy
		user = User.find(params[:id])
		user.soft_delete
		redirect_to users_homes_top_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :email)
	end
end
