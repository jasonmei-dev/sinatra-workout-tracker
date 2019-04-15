class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :workout_id
      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :weight_lbs
      t.string :notes
    end
  end
end
