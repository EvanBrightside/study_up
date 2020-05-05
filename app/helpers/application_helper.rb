module ApplicationHelper
  def students_list(students)
    return 'Студентов нет' if students.empty?

    students
      .map { |el| ["#{el.name}(#{el.email})"] }
      .flatten
      .join(', ')
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    link_to title, {sort: column, direction: direction}, {class: css_class}
  end
end
