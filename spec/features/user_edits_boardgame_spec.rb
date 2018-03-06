require 'rails_helper'

# Acceptance Criteria
# [ ] I can see the edit button if I (the user) submitted the boardgame
# [ ] There is an edit button on the show page
# [ ] I can click the button to edit the boardgame
# [ ] I am linked to a page to edit the selected boardgame
# [ ] I am notified when I edit a boardgame


feature "As an authenticated user
I want to edit a boardgame
so that boardgame has relevant information" do
  scenario 'User edits a boardgame' do
    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame, user: user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    visit boardgame_path(boardgame)

    expect(page).to have_button("Edit this Boardgame")
    click_button 'Edit this Boardgame'
    fill_in "Name", with: "Monopoly"
    fill_in "Publisher", with: "Warner Bros."
    fill_in "Description", with: "This game will teach you about unfair economic markets"
    click_button "Submit"

    expect(page).to have_content("Monopoly")
    expect(page).to have_content("Warner Bros")
  end

  scenario 'User incorrectly edits a boardgame' do
    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame, user: user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
    visit boardgame_path(boardgame)

    expect(page).to have_button("Edit this Boardgame")
    click_button 'Edit this Boardgame'
    fill_in "Name", with: "Monopoly"
    fill_in "Description", with: "This game will teach you about unfair economic markets"
    click_button "Submit"

    expect(page).to have_content(boardgame.errors.full_messages.first)
  end
end
