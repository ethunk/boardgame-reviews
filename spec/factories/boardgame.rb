FactoryBot.define do
  factory :boardgame do
    sequence(:name) {|n| "Boardgame #{n}" }
    user_id '1'
    description 'This is a boardgame description'
    publisher 'This is a publisher'

    user
  end
end
