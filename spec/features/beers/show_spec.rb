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
    save_and_open_page

    expect(page).to have_content("Beer Index")
    expect(page).to have_content(beer.name)
    expect(page).to_not have_content(beer2.name)
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
    save_and_open_page

    expect(page).to have_content(brewery.name)
  end
end
