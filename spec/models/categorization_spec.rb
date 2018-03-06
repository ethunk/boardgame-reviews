require 'rails_helper'

RSpec.describe Categorization, type: :model do
  it { should belong_to(:boardgame) }
  it { should belong_to(:category) }
end
