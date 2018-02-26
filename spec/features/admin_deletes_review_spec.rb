require "rails_helper"

# Acceptance Criteria
# [x] I want to be on the Boardgame show/details page and see a list of reviews
# [x] I want to be able to delete any reviews I submit

feature "As an admin
I want to delete a review
So that I can erase my offensive reviews" do

  def login(user=nil)
    if user == nil
      user = FactoryBot.create(:user)
    end
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button "Log in"
  end

  scenario "user deletes a review on a page" do
    admin = FactoryBot.create(:user, role: 'admin')
    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame, user: user)
    review = FactoryBot.create(:review, body: 'This is a review', boardgame: boardgame, user: user)
    login(admin)

    click_link boardgame.name
    expect(page).to have_button('Delete')
    click_button 'Delete'

    expect(page).to_not have_content('This is a review')
  end
end
