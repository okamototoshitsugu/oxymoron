class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
     t.string :memo
     t.integer :important_status, null: false, default: 0
     t.integer :share
     t.string :title
     t.integer :user_id
     t.datetime :start_date_time
     t.datetime :end_date_time
     t.timestamps
    end
  end
end
