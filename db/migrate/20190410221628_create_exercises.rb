class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :weight_lbs
    end
  end
end
