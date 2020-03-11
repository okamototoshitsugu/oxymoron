class CreateTaskTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :task_trees do |t|

      t.timestamps
    end
  end
end
