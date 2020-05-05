require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "associations" do
    it { should have_many(:student_groups) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }

    context '.students_count_not_negative' do
      let!(:course_1) { create :course }
      let!(:course_2) { create :course }
      let!(:student_group_1) { create :student_group, course_id: course_1.id }
      let!(:student_group_2) { create :student_group, course_id: course_2.id }
      let!(:student) { create :student, student_group_id: student_group_2.id }

      it 'is expected to validate that :students count is zero' do
        expect(course_1.students_count.zero?).to be true
      end

      it 'is expected to validate that :students count is positive' do
        expect(course_2.students_count.positive?).to be true
      end
    end
  end
end
