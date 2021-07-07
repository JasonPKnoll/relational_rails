require 'rails_helper'

RSpec.describe 'the brewery show page' do
  it 'displays the brewery name, location, and year_established' do
    brewery = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                             )
    visit "/breweries/#{brewery.id}"
    save_and_open_page

    expect(page).to have_content(brewery.name)
    expect(page).to have_content("Location: #{brewery.location}")
    expect(page).to have_content("Year established: #{brewery.year_established}")
  end
end
