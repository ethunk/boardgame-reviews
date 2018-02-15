FactoryBot.define do
  factory :boardgame do
    sequence(:name) {|n| "Boardgame #{n}" }
    user '1'
    description 'This is a boardgame description'
    publisher 'This is a publisher'
    rating '4'

    user
  end
end
