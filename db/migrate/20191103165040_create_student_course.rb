class CreateStudentCourse < ActiveRecord::Migration[5.1]
  def change
    create_table :student_courses do |t|
      t.integer :grade, default: 0
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
    end
  end
end
