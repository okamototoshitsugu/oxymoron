class Users::GraphsController < ApplicationController

	def show
		@user = current_user
		start_date = Time.current.beginning_of_month
		end_date = Time.current.end_of_month
		@tasks = Task.where(important_status: 1, created_at: start_date..end_date).pluck(:created_at)
			a = 0
		result_1 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_1|
			a += array_1.count
		end
		puts result_1

		@tasks = Task.where(important_status: 2, created_at: start_date..end_date).pluck(:created_at)
			b = 0
		result_2 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_2|
			b += array_2.count
		end
		puts result_2

		@tasks = Task.where(important_status: 3, created_at: start_date..end_date).pluck(:created_at)
			c = 0
		result_3 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_3|
			c += array_3.count
		end
		puts result_3

		@tasks = Task.where(important_status: 4, created_at: start_date..end_date).pluck(:created_at)
			d = 0
		result_4 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_4|
			d += array_4.count
		end
		puts result_4





        gon.important_status_1 = result_1
        gon.important_status_2 = result_2
        gon.important_status_3 = result_3
		gon.important_status_4 = result_4
		gon.month = (Date.current.beginning_of_month..Date.current.end_of_month).to_a
	# 	@tasks = Task.where(important_status: 1,)
	# 	p @tasks.count
	# 	@tasks = Task.where(important_status: 2,)
	# 	p @tasks.count
	# 	@tasks = Task.where(important_status: 3,)
	# 	p @tasks.count
	# 	@tasks = Task.where(important_status: 4,)
	# 	p @tasks.count
	end
end
