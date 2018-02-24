require "rails_helper"

# Acceptance Criteria
# [ ] I want to be on the Boardgame show/details page and see a list of reviews
# [ ] I want to write a review for a specific boardgame
# [ ] I want to be able to edit any reviews I submit

feature "As a user
I want to edit a review
So that I can change any grammatical errors i make" do

  xscenario "user writes a review and sees on page" do
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

  xscenario "user writes an invalid review and sees error on page" do
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
