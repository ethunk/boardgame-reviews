require 'rails_helper'

# Acceptance Criteria
# [x] Visiting the users index page
#     An admin can view all users
# [x] admin can click the button to delete a user


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
I want visit the users index page
and see the option to delete users" do
  scenario 'Admin deletes a boardgame from index page' do
    @admin = FactoryBot.create(:user, role: 'admin')
    @user_one = FactoryBot.create(:user, email: 'test@test.com')
    @user_two = FactoryBot.create(:user)
    @user_three = FactoryBot.create(:user)
    @user_four = FactoryBot.create(:user)
    login(@admin)
    visit admin_users_path
    expect(page).to have_button("Delete")
    click_button(@user_one.id)
    expect(page).to have_content('User Deleted')
    expect(page).to_not have_content(@user_one.email)
  end
end
