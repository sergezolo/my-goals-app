class ChangeColumnNameInGoals < ActiveRecord::Migration[5.2]
  def change
    rename_column :goals, :tasks, :title
  end
end
