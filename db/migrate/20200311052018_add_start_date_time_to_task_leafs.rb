class AddStartDateTimeToTaskLeafs < ActiveRecord::Migration[5.2]
  def change
    add_column :task_leafs, :start_date_time, :datetime
    add_column :task_leafs, :end_date_time, :datetime
  end
end
