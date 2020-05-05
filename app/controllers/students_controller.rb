class StudentsController < ApplicationController
  respond_to :html, :json

  def new
    @course = Course.find(params[:course][:id])
    @student = Student.new
    respond_modal_with @student
  end

  def create
    course = Course.find(params[:student][:course_id])
    student_group_id = find_group(course)

    (redirect_to course_path(course.id) and return) if student_group_id.nil?

    full_params = student_params.merge(student_group_id: student_group_id)

    @student = Student.new(full_params)
    if @student.save!
      respond_modal_with @student, location: course_path(course.id)
      head :created
    else
      render :new
      head :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email)
  end

  def find_group(course)
    course_groups = course.student_groups
    group = course_groups.select{ |el| el.students.size < 8 }.first

    group&.id
  end
end
