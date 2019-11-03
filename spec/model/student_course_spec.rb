require 'rails_helper'

RSpec.describe StudentCourse, type: :model do
  describe 'validations' do
    it { should validate_presence_of :grade }
  end

  describe 'relationships' do
    it { should belong_to :student }
    it { should belong_to :course }
  end

  describe 'class methods' do
    it '#sort_by_grade' do
      michael = Student.create!(name: 'Michael')
      veronica = Student.create!(name: 'Veronica')
      rails = Course.create!(name: 'Rails')
      student_course_1 = StudentCourse.create!(student: michael, course: rails, grade: 1)
      student_course_2 = StudentCourse.create!(student: veronica, course: rails, grade: 0)
  
      expect(rails.student_courses.sort_by_grade).to eq([student_course_2, student_course_1])
    end
  end

  describe 'instance methods' do
  end
end