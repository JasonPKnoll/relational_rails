require 'rails_helper'

RSpec.describe 'the brewery index page' do
  it 'displays the brewery names' do
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
    brewery1 = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                             )
    brewery2 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                            )
    visit "/breweries"
    save_and_open_page

    expect(page).to have_content(brewery1.name)
    expect(page).to have_content(brewery2.name)
  end
end
