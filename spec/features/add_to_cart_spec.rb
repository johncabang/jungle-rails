require 'rails_helper'

RSpec.feature "Visitor clicks Add to Cart button for a product and cart increases by one", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visitor clicks Add to Cart button, cart increases by one" do
    visit root_path

    # commented out b/c it's for debugging only
    first('.product').click_button('Add')
    # puts page.html
    save_screenshot "test_add_to_cart.png"
    
    expect(page).to have_text 'My Cart (1)'

  end
end