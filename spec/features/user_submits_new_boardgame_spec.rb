require 'rails_helper'

# Acceptance Criteria
# [ x] There is a new page
# [ x] I can submit a form to add a boardgame
# [ x] I am notified when I create a boardgame
# [ x] I am notified when form is filled out incorrectly with error messages

feature "As an authenticated user
I want to add a boardgame
So that others can review it" do

  scenario 'User fills in boardgame form and submits' do
    visit '/boardgames'
    expect(page.html.include?('Submit Boardgame')).to be false

    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit boardgames_path
    click_link 'Submit New Boardgame'
    fill_in :boardgame_name, with: "Monopoly"
    fill_in :boardgame_description, with: "Play to make unfair market conditions"
    fill_in :boardgame_publisher, with: "Warner Bros."

    click_button "Submit New Boardgame"

    expect(page).to have_content("Monopoly")
    expect(page).to have_content("Boardgame Created!")
  end

  scenario 'User fills in boardgame form with invalid information' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit boardgames_path
    click_link 'Submit New Boardgame'
    click_button "Submit New Boardgame"
    expect(page).to have_content("Publisher can't be blank")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
