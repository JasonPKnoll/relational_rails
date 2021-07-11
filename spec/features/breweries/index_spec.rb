require 'rails_helper'

RSpec.describe 'the brewery index page' do
  it 'displays the brewery names' do
    brewery1 = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                               multiple_brewhouses: true
                             )
    brewery2 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    visit "/breweries"

    expect(page).to have_content(brewery1.name)
    expect(page).to have_content(brewery2.name)
  end

  it 'displays breweries sorted by most recently created' do
    brewery1 = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                               multiple_brewhouses: true
                             )
    brewery2 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                             )
    brewery3 = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                              multiple_brewhouses: false
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

  it 'displays links to all index pages' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    beer = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55,
                        non_alcoholic: false
                      )

    visit "/breweries"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end

  it 'displays link to add a new brewery' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    beer = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55,
                        non_alcoholic: false
                      )
    visit "/breweries"

    expect(page).to have_link("New Brewery")
  end
end
