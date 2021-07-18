class CoursesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @courses = Course.includes(:student_groups).order("#{sort_column} #{sort_direction}")
  end

  def show
    @course = Course.find(params[:id])
    @groups = @course.student_groups.includes([:students])
  end

  private

  def sort_column
    Course.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
