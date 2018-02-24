require "rails_helper"

# Acceptance Criteria
# [ ] I want to be on the Boardgame show/details page and see a list of reviews
# [ ] I want to write a review for a specific boardgame
# [ ] I want to be able to edit any reviews I submit

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

  def create_review(boardgame)
    click_link boardgame.name
    expect(page).to have_button('Submit Review')
    click_button('Submit Review')

    fill_in "Body", with: "This game is AEsome!!!"
    select("2", from: "review_rating").select_option
    click_button "Submit"
  end

  scenario "user edits a review on a page" do

    boardgame = FactoryBot.create(:boardgame)
    review = FactoryBot.create(:review, boardgame: boardgame)
    login
    create_review(boardgame)
    expect(page).to have_button('Edit')
    binding.pry
    click_button ' Edit '
    fill_in 'Body', with: "This game is Awesome!!!!"
    click_button 'Submit'

    expect(page).to have_content('This game is Awesome!!!!')
  end

  scenario "a user cannot edit a review they did't write" do
    user_one = FactoryBot.create(:user)
    user_two = FactoryBot.create(:user)
    boardgame = FactoryBot.create(:boardgame)
    review = FactoryBot.create(:review, boardgame: boardgame, user: user_one)

    login(user_two)

    click_link boardgame.name
    expect(page).to not_have_button('Edit')

  end
end
