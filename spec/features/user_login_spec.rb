require 'rails_helper'

RSpec.feature "login spec", type: :feature, js: true do
  before :each do
    User.create(
      first_name: "first_name",
      last_name: 'last_name',
      email: 'email@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end
  
  scenario "They are able to signup " do

    visit '/signup'

    save_screenshot

    expect(page).to have_text("Login")
    expect(page).to have_text("Signup")
    # page.find('.btn-primary', match: :first).click
    fill_in 'First Name', with: 'firstname'
    fill_in 'Last Name', with: 'lastname'
    fill_in 'Email', with: 'email'
    fill_in 'Password', with: 'password123'
    fill_in 'Password Confirmation', with: 'password123'
    
    save_screenshot

    page.find('.btn-primary').click

    expect(page).to have_text("Signed in as firstname lastname")
    expect(page).to have_text("Logout")
    expect(current_path).to eq("/")
    save_screenshot
  end

  scenario "can login" do
   

    visit '/login'

    save_screenshot

    expect(page).to have_text("Login")
    expect(page).to have_text("Signup")
    # page.find('.btn-primary', match: :first).click
    fill_in 'email', with: 'email@email.com'
    fill_in 'password', with: 'password'
    
    save_screenshot

    page.find_button('Submit').click

    expect(page).to have_text("Signed in as first_name last_name")
    expect(page).to have_text("Logout")
    expect(current_path).to eq("/")
    save_screenshot
  end
end