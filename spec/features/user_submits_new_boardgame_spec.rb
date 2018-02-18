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
    it 'will not display a submit form if user is unathenticated' do
      visit boardgames_path
      expect(page).to not_have('Submit Boardgame')
    end

    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit boardgames_path
    click_link 'Submit Boardgame'
    fill_in :name, with: "Monopoly"
    fill_in :description, with: "Play to make unfair market conditions"
    fill_in :publisher, with: "Warner Bros."

    click_button "Submit Boardgame"

    expect(page).to have_content("Monopoly")
  end

  scenario 'User fills in boardgame form with invalid information' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    visit boardgames_path
    click_link 'Create New Boardgame'
    fill_in :boardgame_zip_code, with: "043"
    click_button "Create Boardgame"
    expect(page).to have_content("Location name can't be blank")
    expect(page).to have_content("Street address can't be blank")
    expect(page).to have_content(
      "Zip code is the wrong length (should be 5 characters)"
    )
    expect(page).to have_content("Description can't be blank")
  end
end
