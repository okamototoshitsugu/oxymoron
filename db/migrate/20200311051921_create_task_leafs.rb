class CreateTaskLeafs < ActiveRecord::Migration[5.2]
  def change
    create_table :task_leafs do |t|

      t.timestamps
    end
  end
end
