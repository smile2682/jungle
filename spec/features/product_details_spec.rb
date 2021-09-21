require 'rails_helper'

RSpec.feature "Vistors can see product details", type: :feature, js: true do
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
  scenario "They see a specific product" do
    visit root_path

    first('article.product').click_link('Details')

    #DEBUG
    save_screenshot

    expect(page).to have_css 'section.products-show'

    

  end
end
