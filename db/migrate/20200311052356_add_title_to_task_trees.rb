class AddTitleToTaskTrees < ActiveRecord::Migration[5.2]
  def change
    add_column :task_trees, :title, :string
  end
end
