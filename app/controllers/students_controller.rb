class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:student_id])
  end
end