class AddNameToTaskLeafs < ActiveRecord::Migration[5.2]
  def change
    add_column :task_leafs, :memo, :string
    add_column :task_leafs, :bookmark_status, :integer
    add_column :task_leafs, :important_status, :integer
    add_column :task_leafs, :share, :integer
  end
end
