require 'rails_helper'

RSpec.describe 'the beer index page' do
  it 'displays the beer names' do
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
    beer1 = Beer.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55)
    beer2 = Beer.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0)
    visit "/beers"
    save_and_open_page

    expect(page).to have_content("All Beers")
    expect(page).to have_content(beer1.name)
    expect(page).to have_content(beer2.name)
  end

end
