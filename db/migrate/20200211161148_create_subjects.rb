class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :student_id
      t.integer :teacher_id
      t.string :time
      t.string :room
      t.integer :room_limit

      t.timestamps
    end
  end
end
