class StudentGroup < ApplicationRecord
  STUDENTS_LIMIT = 8

  validates :name, presence: true

  has_many :students, dependent: :destroy
  belongs_to :course
end
