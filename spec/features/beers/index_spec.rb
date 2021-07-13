require 'rails_helper'

RSpec.describe 'the beer index page' do
  it 'displays the beer names, styles, abv, ibu, and if its non_alcoholic' do
    #user story 3
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
    brewery2 = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                              multiple_brewhouses: false
                            )
    beer3 = brewery2.beers.create!(name: "Big Gay IPA",
                        style:   "American IPA",
                        abv: 5.0,
                        ibu: 50,
                        non_alcoholic: true
                      )
    visit "/beers"

    expect(page).to have_content("All Beers")
    expect(page).to have_content(beer1.name)
    expect(page).to have_content(beer2.name)
    expect(page).to have_content(beer3.name)
    expect(page).to have_content("Style: #{beer1.style}")
    expect(page).to have_content("Style: #{beer2.style}")
    expect(page).to have_content("Style: #{beer3.style}")
    expect(page).to have_content("ABV(%): #{beer1.abv}")
    expect(page).to have_content("ABV(%): #{beer2.abv}")
    expect(page).to have_content("ABV(%): #{beer3.abv}")
    expect(page).to have_content("IBU: #{beer1.ibu}")
    expect(page).to have_content("IBU: #{beer2.ibu}")
    expect(page).to have_content("IBU: #{beer3.ibu}")
    expect(page).to have_content("Non Alcoholic: #{beer1.non_alcoholic}")
    expect(page).to have_content("Non Alcoholic: #{beer2.non_alcoholic}")
    expect(page).to have_content("Non Alcoholic: #{beer3.non_alcoholic}")
  end

  it 'displays links to all index pages' do
    # user stories 8 and 9
    visit "/beers"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end


  it 'only shows true records' do
    #user story 15
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
    brewery2 = Brewery.create!(name: "Athletic Brewing Co",
                              location: "Stratford, CT",
                              year_established: 2018,
                              multiple_brewhouses: false
                            )
    beer2 = brewery2.beers.create!(name: "Run Wild IPA",
                        style: "IPA",
                        abv: 0.4,
                        ibu: 35,
                        non_alcoholic: true
                      )
    visit "/beers"

    expect(page).to have_content(beer2.name)
    expect(page).to_not have_content(beer1.name)
  end

  it 'links to the edit page from beers index page, updates beer, and redirects to the beer show page' do
    # user story 18
    brewery = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                              multiple_brewhouses: false
                            )

    beer1 = brewery.beers.create!(name: "Gay IPA",
                                style: "IPA",
                                abv: 0,
                                ibu: 0,
                                non_alcoholic: true
                                )
    beer2 = brewery.beers.create!(name: "Kodiak Brown",
                                style: "Brown Ale",
                                abv: 5.2,
                                ibu: 20,
                                non_alcoholic: true
                                )
    visit "/beers"

    expect(page).to have_link("Update #{beer1.name}")

    click_link("Update #{beer1.name}")

    fill_in('name', with: 'Big Gay IPA')
    fill_in('style', with: 'American IPA')
    fill_in('abv', with: 5.0)
    fill_in('ibu', with: 50)
    page.choose('non_alcoholic', with: false)

    click_button('Update Beer')

    expect(current_path).to eq("/beers/#{beer1.id}")
    expect(page).to have_content("Style: American IPA")
    expect(page).to have_content("ABV(%): 5.0")
    expect(page).to have_content("IBU: 50")
    expect(page).to have_content("Non Alcoholic: false")
  end
end
