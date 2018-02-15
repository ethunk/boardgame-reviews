require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should have_many(:votes) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user) }
  it { should validate_numericality_of(:rating) }
end
