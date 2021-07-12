require 'rails_helper'

RSpec.describe "Brewery's beers index page" do
  it 'displays the beers associated with that brewery and the beers attributes' do
    brewery1 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    brewery2 = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                              multiple_brewhouses: false
                            )
    beer1 = brewery1.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55,
                        non_alcoholic: false
                      )
    beer2 = brewery1.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0,
                        non_alcoholic: false
                      )
    beer3 = brewery2.beers.create!(name: "Big Gay IPA",
                        style:   "American IPA",
                        abv: 5.0,
                        ibu: 50,
                        non_alcoholic: false
                      )
    visit "/breweries/#{brewery1.id}/beers"

    expect(page).to have_content("All beers made by #{brewery1.name}:")
    expect(page).to have_content(beer1.name)
    expect(page).to have_content(beer2.name)
    expect(page).to_not have_content(beer3.name)
    expect(page).to have_content("Style: #{beer1.style}")
    expect(page).to have_content("Style: #{beer2.style}")
    expect(page).to have_content("ABV(%): #{beer1.abv}")
    expect(page).to have_content("ABV(%): #{beer2.abv}")
    expect(page).to have_content("IBU: #{beer1.ibu}")
    expect(page).to have_content("IBU: #{beer2.ibu}")
    expect(page).to have_content("Non Alcoholic: #{beer1.non_alcoholic}")
    expect(page).to have_content("Non Alcoholic: #{beer2.non_alcoholic}")
  end

  it 'displays links all index pages' do
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

    visit "/breweries/#{brewery.id}/beers"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end

  it 'has a link that sorts page by alphabetical order' do
    brewery1 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    beer1 = brewery1.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55,
                        non_alcoholic: false
                      )
    beer2 = brewery1.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0,
                        non_alcoholic: false
                      )
    beer3 = brewery1.beers.create!(name: "Pooltime Ale",
                        style: "Wheat Beer",
                        abv: 5.0,
                        ibu: 0,
                        non_alcoholic: false
                      )
    visit "/breweries/#{brewery1.id}/beers"

    click_link("Sort in alphabetical order")

    expect(current_path).to eq("/breweries/#{brewery1.id}/beers")
    expect(beer2.name).to appear_before(beer3.name)
    expect(beer3.name).to appear_before(beer1.name)
  end
end
