require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do
  scenario "They see all products" do

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
end