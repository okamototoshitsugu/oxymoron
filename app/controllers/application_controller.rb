class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:email, :password, :password_confirmation, :name)}
	end

	def after_sign_in_path_for(resource)
		case resource
		when Admin
			admins_homes_top_path
		when User
			users_tasks_path
		end
	end
end
