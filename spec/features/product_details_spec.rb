require 'rails_helper'

RSpec.feature "Visitor navigates to certain product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(),
        description: Faker::Hipster.paragraph(),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 100 * n
      )
    end
  end

  scenario "They see product name of " do
    # ACT
    visit '/'
    first_product = Product.all.order(created_at: :desc).first
    page.find('.products > .product:first-child > header a').click

  

    # VERIFY
    expect(page).to have_css('.products-show')
    expect(page).to have_css('.product-detail')
    expect(page).to have_text('Description')
    expect(page).to have_text(first_product.name)

    # DEBUG
    # save_screenshot
  end
end