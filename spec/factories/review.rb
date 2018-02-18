FactoryBot.define do
  factory :review do
    user_id '1'
    boardgame_id '1'
    rating '4'
    body 'this ia the body of a review'

    user
    boardgame
  end
end
