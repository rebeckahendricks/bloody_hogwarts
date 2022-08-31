class StudentsController < ApplicationController
  def index
    @students = Student.all.sort_by_name
  end

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end
end
