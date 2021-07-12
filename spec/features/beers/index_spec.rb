require 'rails_helper'

RSpec.describe 'the beer index page' do
  it 'displays the beer names, styles, abv, ibu, and if its non_alcoholic' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    beer1 = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55,
                        non_alcoholic: true
                      )
    beer2 = brewery.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0,
                        non_alcoholic: true
                      )
    visit "/beers"

    expect(page).to have_content("All Beers")
    expect(page).to have_content(beer1.name)
    expect(page).to have_content(beer2.name)
    expect(page).to have_content("Style: #{beer1.style}")
    expect(page).to have_content("Style: #{beer2.style}")
    expect(page).to have_content("ABV(%): #{beer1.abv}")
    expect(page).to have_content("ABV(%): #{beer2.abv}")
    expect(page).to have_content("IBU: #{beer1.ibu}")
    expect(page).to have_content("IBU: #{beer2.ibu}")
    expect(page).to have_content("Non Alcoholic: #{beer1.non_alcoholic}")
    expect(page).to have_content("Non Alcoholic: #{beer2.non_alcoholic}")
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

    visit "/beers"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end

  it 'only shows true records' do
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    beer1 = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55,
                        non_alcoholic: false
                      )
    brewery2 = Brewery.create!(name: "Athletic Brewing Co",
                              location: "Stratford, CT",
                              year_established: 2018,
                              multiple_brewhouses: false
                            )
    beer3 = brewery2.beers.create!(name: "Run Wild IPA",
                        style: "IPA",
                        abv: 0.4,
                        ibu: 35,
                        non_alcoholic: true
                      )
    visit "/beers"

    expect(page).to have_content("Run Wild IPA")
    expect(page).to_not have_content("Two Hearted Ale")
  end
end
