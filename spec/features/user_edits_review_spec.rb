require "rails_helper"

# Acceptance Criteria
# [x] I want to be on the Boardgame show/details page and see a list of reviews
# [x] I want to write a review for a specific boardgame
# [x] I want to be able to edit any reviews I submit

feature "As a user
I want to edit a review
So that I can change any grammatical errors I make" do

  def login(user=nil)
    if user == nil
      user = FactoryBot.create(:user)
    end
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button "Log in"
  end

  scenario "user edits a review on a page" do
    user = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame, user: user)
    review = FactoryBot.create(:review, boardgame: boardgame, user:user)
    login(user)
    click_link boardgame.name
    expect(page).to have_button('Edit')
    click_button ' Edit '
    fill_in 'Body', with: "This game is Awesome!!!!"
    click_button 'Submit'

    expect(page).to have_content('This game is Awesome!!!!')
  end

  scenario "a user cannot edit a review they didn't write" do
    user_one = FactoryBot.create(:user)
    user_two = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame, user: user_one)
    review = FactoryBot.create(:review, boardgame: boardgame, user: user_one)

    login(user_two)

    click_link boardgame.name
    expect(page).to_not have_content('Edit')

  end
end
