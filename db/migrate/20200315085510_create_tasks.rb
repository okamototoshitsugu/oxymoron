class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
     t.string :memo
     t.integer :bookmark_status
     t.integer :important_status
     t.integer :share
     t.string :title
     t.integer :user_id
     t.datetime :start_date_time
     t.datetime :end_date_time
     t.timestamps
    end
  end
end
