require 'rails_helper'

RSpec.describe Rental, type: :model do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_date) }

    context 'when end_date is present' do
      it 'validates that end_date is greater than start_date' do
        rental = build(:rental, start_date: '2024-11-01', end_date: '2024-10-31', user: user, book: book)
        expect(rental).not_to be_valid
        expect(rental.errors[:end_date]).to include('must be greater than 2024-11-01')
      end
    end

    context 'when end_date is nil' do
      it { should allow_value(nil).for(:end_date) }
    end
  end
end
