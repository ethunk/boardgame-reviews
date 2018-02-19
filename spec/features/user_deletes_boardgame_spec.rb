require 'rails_helper'

# Acceptance Criteria
# [ ] There is a delete button on the show page
# [ ] I can click the button to delete a boardgame
# [ ] I am notified when I delete a boardgame
# [ ] I can only see the delete button if I own the boardgame

feature "As an authenticated user
I want to delete a boardgame
and all reviews for that boardgame" do
  scenario 'User deletes a boardgame' do

    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame, user: user)
    review = FactoryBot.create(:user, user, boardgame)

    visit boargame_path(boardgame)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    visit boardgame_path(boardgame)

    expect(page).to have_button("Delete this Boardgame")
    click_button 'Delete this Boardgame'
    # Where should I be directed to?
    expect(page).to have_content("Boardgame Deleted")

    #expect to have the review deleted
    expect(review).to be nil
  end

  scenario 'User who does not own the boardgame, cannot see the delete button' do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame, user: user)
    visit new_user_session_path
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button "Log in"
    visit boardgame_path(boardgame)

    expect(page).to_not have_button("Delete this Boardgame")
  end
end
