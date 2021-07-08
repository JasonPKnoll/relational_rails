require 'rails_helper'

RSpec.describe "Brewery's beers index page" do
  it 'displays the beers associated with that brewery and the beers attributes' do
    brewery1 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                            )
    brewery2 = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                            )
    beer1 = brewery1.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55
                      )
    beer2 = brewery1.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0
                      )
    beer3 = brewery2.beers.create!(name: "Big Gay IPA",
                        style:   "American IPA",
                        abv: 5.0,
                        ibu: 50
                      )
    visit "/breweries/#{brewery1.id}/beers"
    save_and_open_page

    expect(page).to have_content("All beers made by #{brewery1.name}:")
    expect(page).to have_content(beer1.name)
    expect(page).to have_content(beer2.name)
    expect(page).to_not have_content(beer3.name)
  end
end
