class StudentGroup < ApplicationRecord
  validates :name, presence: true

  has_many :students, dependent: :destroy
  belongs_to :course
end
