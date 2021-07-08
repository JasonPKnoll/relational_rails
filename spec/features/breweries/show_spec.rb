require 'rails_helper'

RSpec.describe 'the brewery show page' do
  it 'displays the brewery name, location, and year_established' do
    brewery = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                             )
    visit "/breweries/#{brewery.id}"

    expect(page).to have_content(brewery.name)
    expect(page).to have_content("Location: #{brewery.location}")
    expect(page).to have_content("Year established: #{brewery.year_established}")
  end

  it 'displays the number of beers associated with the brewery' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                            )
    beer1 = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55
                      )
    beer2 = brewery.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0
                      )
    visit "breweries/#{brewery.id}"

    expect(page).to have_content("Number of beers: 2")
  end

  it 'displays links to the brewery index and the beer index pages' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985
                            )
    beer = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55
                      )

    visit "/breweries/#{brewery.id}/beers"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
  end
end
