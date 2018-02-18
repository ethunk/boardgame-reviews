require 'rails_helper'

RSpec.describe Boardgame, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:publisher) }


  describe '.avg_rating' do
    context 'there are reviews with ratings' do
      it 'should calulate average rating for boardgame' do
        boardgame = FactoryBot.create(:boardgame)
        FoactoryBot.create(:review, boardgame: boardgame)
        FoactoryBot.create(:review, rating: 3, boardgame: boardgame)
        expect(bathroom.avg_rating).to eq(4.0)
      end
    end

    context 'there are no reviews or ratings for this bathroom' do
      it 'should return 0.0 for the average rating of the bathroom' do
        bathroom = FactoryGirl.create(:bathroom)
        expect(bathroom.avg_rating).to eq(0.0)
      end
    end
  end

end
