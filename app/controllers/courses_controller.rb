class CoursesController < ApplicationController
  def index
    @courses = Course.all.sort_by_name
    @students = Student.all.sort_by_name
  end
end
