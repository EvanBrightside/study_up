class Course < ApplicationRecord
  validates :name, :start_date, presence: true
  has_many :student_groups, dependent: :destroy

  def students_count
    student_groups.map { |el| el.students.size }.sum
  end
end
