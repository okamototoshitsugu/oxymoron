class CreateSubTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_tasks do |t|
      t.string :memo
      t.integer :important_status
      t.string :title
      t.integer :user_id
      t.references :task, foreign_key: true
      t.datetime :start_date_time
      t.datetime :end_date_time

      t.timestamps
    end
  end
end
