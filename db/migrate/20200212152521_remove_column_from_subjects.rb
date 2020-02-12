class RemoveColumnFromSubjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :subjects, :student_id
  end
end
