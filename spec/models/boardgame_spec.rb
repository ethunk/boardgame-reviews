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
        FactoryBot.create(:review, rating: 5, boardgame: boardgame)
        FactoryBot.create(:review, rating: 3, boardgame: boardgame)
        expect(boardgame.avg_rating).to eq(4.0)
      end
    end

    context 'there are no reviews or ratings for this boardgame' do
      it 'should return 0.0 for the average rating of the boardgame' do
        boardgame = FactoryBot.create(:boardgame)
        expect(boardgame.avg_rating).to eq(0.0)
      end
    end
  end

end
