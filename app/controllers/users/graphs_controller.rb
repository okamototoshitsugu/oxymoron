class Users::GraphsController < ApplicationController

	def show
		@user = current_user
		current_month_tasks = {}
		current_month_days = (Time.current.beginning_of_month.strftime("%Y-%m-%d")..Time.current.strftime("%Y-%m-%d")).to_a
		current_month_days.each{|current_month_day| current_month_tasks[current_month_day] = 0}
		chart_data_1 = current_month_tasks.merge(Task.where(important_status:1).group("date(created_at)").size)
		data_1 = {}
		current_month_days.each_with_index{|current_month_day,i| data_1[current_month_day] = chart_data_1.values.slice(0,i+1).sum}
		puts data_1.values
		gon.important_status_1 = data_1.values

		chart_data_2 = current_month_tasks.merge(Task.where(important_status:2).group("date(created_at)").size)
		data_2 = {}
		current_month_days.each_with_index{|current_month_day,i| data_2[current_month_day] = chart_data_2.values.slice(0,i+1).sum}
		puts data_2.values
		gon.important_status_2 = data_2.values

		chart_data_3 = current_month_tasks.merge(Task.where(important_status:3).group("date(created_at)").size)
		data_3 = {}
		current_month_days.each_with_index{|current_month_day,i| data_3[current_month_day] = chart_data_3.values.slice(0,i+1).sum}
		puts data_3.values
		gon.important_status_3 = data_3.values

		chart_data_4 = current_month_tasks.merge(Task.where(important_status:4).group("date(created_at)").size)
		data_4 = {}
		current_month_days.each_with_index{|current_month_day,i| data_4[current_month_day] = chart_data_4.values.slice(0,i+1).sum}
		puts data_4.values
		gon.important_status_4 = data_4.values







gon.month = (Date.current.beginning_of_month..Date.current.end_of_month).to_a




# start_date = Time.current.beginning_of_month
# end_date = Time.current.end_of_month
# @tasks = Task.where(important_status: 1, created_at: start_date..end_date).pluck(:created_at)
# a = 0
# result_1 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_1|
# 	a += array_1.count
# end
# puts result_1

# @tasks = Task.where(important_status: 2, created_at: start_date..end_date).pluck(:created_at)
# b = 0
# result_2 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_2|
# 	b += array_2.count
# end
# puts result_2

# @tasks = Task.where(important_status: 3, created_at: start_date..end_date).pluck(:created_at)
# c = 0
# result_3 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_3|
# 	c += array_3.count
# end
# puts result_3

# @tasks = Task.where(important_status: 4, created_at: start_date..end_date).pluck(:created_at)
# d = 0
# result_4 = @tasks.group_by { |a| a.strftime('%D') }.map do |date,array_4|
# 	d += array_4.count
# end
# puts result_4





# gon.important_status_1 = result_1
# gon.important_status_2 = result_2
# gon.important_status_3 = result_3
# gon.important_status_4 = result_4
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
