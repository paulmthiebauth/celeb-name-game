require 'rails_helper'

feature 'user should be able to search for a particular movie', %Q{
  As a user
  I want to search for a particular movie
  So that I can play the matching game for that movie
} do

  scenario 'user visits home page' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Celebri')
    expect(page).to have_button('Game on!')
  end
end
