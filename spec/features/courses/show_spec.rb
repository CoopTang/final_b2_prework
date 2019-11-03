require 'rails_helper'

RSpec.describe 'As a user' do 
  describe 'when I visit a course show page' do
    scenario "I see the info" do
      michael = Student.create!(name: 'Michael')
      veronica = Student.create!(name: 'Veronica')
      rails = Course.create!(name: 'Rails')
      student_course_1 = StudentCourse.create!(student: michael, course: rails, grade: 1)
      student_course_2 = StudentCourse.create!(student: veronica, course: rails, grade: 0)

      visit "/courses/#{rails.id}"

      within '#course-info' do
        expect(page).to have_content('Name: Rails')
      end

      within "#student-#{michael.id}" do
        expect(page).to have_content('Michael (Grade: B)')
      end

      within "#student-#{veronica.id}" do
        expect(page).to have_content('Veronica (Grade: A)')
      end
    end
  end
end