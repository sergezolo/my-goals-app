class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :tasks
      t.text :notes
      t.integer :user_id
    end
  end
end
