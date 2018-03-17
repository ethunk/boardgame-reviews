require "rails_helper"

feature "user can upload a photo of the gameboard" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password confirmation", with: "boomstick!3vilisd3ad"

    click_button "Sign up"

    visit new_boardgame_path

    attach_file :boardgame_photo, "#{Rails.root}/spec/support/images/photo.png"

    fill_in :boardgame_name, with: "Monopoly"
    fill_in :boardgame_description, with: "Play to make unfair market conditions"
    fill_in :boardgame_publisher, with: "Warner Bros."

    
  end
end
