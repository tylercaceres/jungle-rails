require 'rails_helper'

RSpec.feature "Add to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(),
        description: Faker::Hipster.paragraph(),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit '/'
    save_screenshot
    expect(page).to have_text("My Cart (0)")
    page.find('.btn-primary', match: :first).click
    expect(page).to have_text("My Cart (1)")
    save_screenshot
  end
end