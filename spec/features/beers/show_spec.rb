require 'rails_helper'

RSpec.describe 'the beers show page' do
  it 'displays the beer name' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                            )
    beer = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55
                      )
    beer2 = brewery.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0
                      )
    visit "/beers/#{beer.id}"

    expect(page).to have_content("Beer Index")
    expect(page).to have_content(beer.name)
    expect(page).to_not have_content(beer2.name)
    expect(page).to have_content("Style: #{beer.style}")
    expect(page).to have_content("ABV(%): #{beer.abv}")
    expect(page).to have_content("IBU: #{beer.ibu}")

  end

  it 'displays the name of brewery for the beer' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                            )
    beer = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55
                      )
    beer2 = brewery.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0
                      )
    visit "/beers/#{beer.id}"

    expect(page).to have_content("Brewery: #{brewery.name}")
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
