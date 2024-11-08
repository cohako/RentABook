require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:rentals) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it 'should allow valid email format' do
      user = User.new(name: 'Test User', email: 'test@example.com')
      expect(user).to be_valid
    end

    it 'should not allow invalid email format' do
      user = User.new(name: 'Test User', email: 'invalid_email')
      expect(user).not_to be_valid
    end
  end
end
