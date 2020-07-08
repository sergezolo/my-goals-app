class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_1
      t.string :task_2
      t.string :task_3
      t.string :task_4
      t.string :task_5
      t.string :task_6
      t.string :task_7
      t.integer :goal_id
    end
  end
end
