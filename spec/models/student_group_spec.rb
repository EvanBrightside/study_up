require 'rails_helper'

RSpec.describe StudentGroup, type: :model do
  describe 'associations' do
    it { should have_many(:students) }
    it { should belong_to(:course) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
