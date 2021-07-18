require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'associations' do
    it { should have_many(:student_groups) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }

    context '.students_count_not_negative' do
      let!(:course1) { create :course }
      let!(:course2) { create :course }
      let!(:student_group1) { create :student_group, course_id: course1.id }
      let!(:student_group2) { create :student_group, course_id: course2.id }
      let!(:student) { create :student, student_group_id: student_group2.id }

      it 'is expected to validate that :students count is zero' do
        expect(course1.students_count.zero?).to be true
      end

      it 'is expected to validate that :students count is positive' do
        expect(course2.students_count.positive?).to be true
      end
    end
  end
end
