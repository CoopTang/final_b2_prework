require 'rails_helper'

RSpec.describe 'As a user' do 
  describe 'when I visit a student show page' do
    scenario "I see a student's info" do
      student = Student.create!(name: 'Michael')
      rails = Course.create!(name: 'Rails')
      ruby = Course.create!(name: 'Ruby')
      student_course = StudentCourse.create!(student: student, course: rails, grade: 1)
      student_course = StudentCourse.create!(student: student, course: ruby, grade: 0)

      visit "/students/#{student.id}"

      within '#student-info' do
        expect(page).to have_content('Name: Michael')
      end

      within "#course-#{rails.id}" do
        expect(page).to have_content("Rails: B")
      end

      within "#course-#{ruby.id}" do
        expect(page).to have_content("Ruby: A")
      end
    end
  end
end