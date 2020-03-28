class AddLocationToSubTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :sub_tasks, :location, :string
  end
end
