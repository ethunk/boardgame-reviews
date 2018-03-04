require "rails_helper"

# Acceptance Criteria
# [x] I want to be able to see an upvote option
# [x] I want to be able to see a downvote option

feature "As a user
I want to upvote a review
So that I can inform others of the quality of the review" do

  scenario "user views upvote and downvote options" do
    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame)
    review = FactoryBot.create(:review, boardgame: boardgame)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit boardgame_path(boardgame)
    expect(page).to have_content("0")
  end
end
