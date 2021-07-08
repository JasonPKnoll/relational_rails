require 'rails_helper'

RSpec.describe "the brewery's beers page" do
  it 'displays the beers associated with that brewery and the beers attributes' do
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
    visit "/breweries/#{brewery.id}/beers"
    save_and_open_page
  end
end
