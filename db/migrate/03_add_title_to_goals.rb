class AddTitleToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :title, :string
  end
end
