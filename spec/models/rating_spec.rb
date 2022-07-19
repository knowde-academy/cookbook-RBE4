require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:rating) }
    # validate_numericality_of(:quantity).only_integer 
    # doesn't work when combined with .is_greater_than(0):
    # https://github.com/thoughtbot/shoulda-matchers/issues/784
    it "is expected to validate that :rating looks like integer" do
      rating = Rating.new(rating: "str")
      expect(rating.rating?).to eq(false)
    end
    it { is_expected.to validate_numericality_of(:rating).is_greater_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
  end
  
  describe 'associations' do
      it { is_expected.to belong_to(:recipe) }
      it { is_expected.to belong_to(:user) }
  end
end
