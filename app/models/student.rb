class Student < ApplicationRecord
  validates :name, :email, presence: true

  belongs_to :student_group
end
