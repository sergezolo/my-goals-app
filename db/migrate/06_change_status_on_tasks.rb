class ChangeStatusOnTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :status, :boolean
  end
end
