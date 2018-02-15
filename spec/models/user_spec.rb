require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:boardgames) }
  it { should have_many(:votes) }
end
