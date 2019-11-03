class StudentCourse < ApplicationRecord
  validates_presence_of :grade

  belongs_to :student
  belongs_to :course

  enum grade: %w[A B C D F]

  def self.sort_by_grade
    order(:grade)
  end
end