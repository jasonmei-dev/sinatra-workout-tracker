class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :name
      t.integer :duration_mins
      t.timestamps
    end
  end
end
