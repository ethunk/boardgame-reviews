require "rails_helper"

# Acceptance Criteria
# [ ] I want to be on the Boardgame details page and see form to write a review
# [ ] I want to write a review for a specific boardgame
# [ ] I want to see it on the boardgame details page

feature "As a user
I want to write a review
So that I can inform others of the quality of the boardgame" do

  scenario "user writes a review and sees on page" do
    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame)
    review = FactoryBot.create(:review, boardgame: boardgame)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    click_link boardgame.name
    expect(page).to have_button('Submit Review')
    click_button('Submit Review')

    fill_in "Body", with: "Not very clean"
    select("2", from: "review_rating").select_option
    click_button "Submit"

    expect(page).to have_content("Not very clean")
    expect(page).to have_content(2)
  end

  scenario "user writes an invalid review and sees error on page" do
    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame)
    review = FactoryBot.create(:review, boardgame: boardgame)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"

    click_link boardgame.name
    expect(page).to have_button('Submit Review')
    click_button('Submit Review')

    click_button "Submit"

    expect(page).to have_content("Rating must be greater than or equal to 1")

  end
end
