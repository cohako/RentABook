require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to have_many(:rentals) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
