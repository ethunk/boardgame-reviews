require 'rails_helper'

# Acceptance Criteria
# [x] There is an actions column on the index page
# [x] There is a delete button on the show page
# [x] admin can click the button to delete a boardgame
# [x] I am notified when I delete a boardgame
def setup
  @admin = FactoryBot.create(:user, role: 'admin')
  @user = FactoryBot.create(:user)
  @boardgame = FactoryBot.create(:boardgame, user: @user, name: 'This Boardgame')
  @review = FactoryBot.create(:review, user: @user, boardgame: @boardgame)
end

def login(user=nil)
  if user == nil
    user = FactoryBot.create(:user)
  end
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button "Log in"
end


feature "As an admin
I want to delete a boardgame
and all reviews for that boardgame" do
  scenario 'Admin deletes a boardgame from index page' do
    setup
    login(@admin)
    visit boardgames_path
    expect(page).to have_content('This Boardgame')
    expect(page).to have_content("Actions")
    expect(page).to have_button("Delete")

    click_button 'Delete'
    expect(page).to_not have_content('This Boardgame')
    expect(page).to have_content("Boardgame Deleted")
  end

  scenario 'Admin deletes a boardgame from show page' do
    setup
    login(@admin)
    visit boardgames_path
    click_link(@boardgame.name)

    expect(page).to have_button("Delete this Boardgame")
    click_button 'Delete this Boardgame'

    expect(page).to_not have_content('This Boardgame')
    expect(page).to have_content("Boardgame Deleted")
  end
end
