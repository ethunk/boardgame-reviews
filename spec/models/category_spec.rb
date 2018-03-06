require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:categorizations) }
  it { should have_many(:boardgames) }
  it { should validate_presence_of(:name) }
end
  
