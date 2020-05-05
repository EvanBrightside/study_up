require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "associations" do
    it { should belong_to(:student_group) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
