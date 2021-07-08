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

    expect(page).to have_content(brewery1.name)
    expect(page).to have_content(brewery2.name)
  end

  it 'displays breweries sorted by most recently created' do
    brewery1 = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                             )
    brewery2 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                             )
    brewery3 = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                             )
    visit "/breweries"

    expect(page).to have_content(brewery1.name)
    expect(page).to have_content(brewery2.name)
    expect(page).to have_content(brewery3.name)
    expect(page).to have_content(brewery1.created_at)
    expect(page).to have_content(brewery2.created_at)
    expect(page).to have_content(brewery3.created_at)

    expect("Goldspot Brewing Co").to appear_before("Bells Brewery")
    expect("Bells Brewery").to appear_before("Sierra Nevada Brewing Co")
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
