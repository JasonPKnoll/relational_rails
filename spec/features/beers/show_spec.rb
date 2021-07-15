require 'rails_helper'

RSpec.describe 'the beers show page' do
  it 'displays the beer name and its attributes' do
    #user story 4
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
    beer2 = brewery.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0,
                        non_alcoholic: false
                      )
    visit "/beers/#{beer.id}"

    expect(page).to have_content(beer.name)
    expect(page).to_not have_content(beer2.name)
    expect(page).to have_content("Style: #{beer.style}")
    expect(page).to have_content("ABV(%): #{beer.abv}")
    expect(page).to have_content("IBU: #{beer.ibu}")
    expect(page).to have_content("Non Alcoholic: #{beer.non_alcoholic}")
  end

  it 'displays the name of brewery for the beer' do
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

    visit "/beers/#{beer.id}"

    expect(page).to have_content("Brewery: #{brewery.name}")
  end

  it 'displays links to all index pages' do
    # user stories 8 and 9
    brewery = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                              multiple_brewhouses: false
                            )
    beer = brewery.beers.create!(name: "Gay IPA",
                                style: "IPA",
                                abv: 0,
                                ibu: 0,
                                non_alcoholic: true
                                )

    visit "/beers/#{beer.id}"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end

  it 'links to the update page, updates the beer, and redirects to the beer show page' do
    #user story 14
    brewery = Brewery.create!(name: "Goldspot Brewing Co",
                              location: "Denver, CO",
                              year_established: 2016,
                              multiple_brewhouses: false
                            )
    beer = brewery.beers.create!(name: "Gay IPA",
                                style: "IPA",
                                abv: 0,
                                ibu: 0,
                                non_alcoholic: true
                                )

    visit "/beers/#{beer.id}"

    click_link("Update #{beer.name}")

    expect(current_path).to eq("/beers/#{beer.id}/edit")

    fill_in('name', with: 'Big Gay IPA')
    fill_in('style', with: 'American IPA')
    fill_in('abv', with: 5.0)
    fill_in('ibu', with: 50)
    select('No', :from => "non_alcoholic")
    click_button('Update Beer')

    expect(current_path).to eq("/beers/#{beer.id}")
    expect(page).to have_content("Style: American IPA")
    expect(page).to have_content("ABV(%): 5.0")
    expect(page).to have_content("IBU: 50")
    expect(page).to have_content("Non Alcoholic: false")
  end

  it 'has a link to delete beer, deletes beer, and redirects to beers index page' do
    #user story 20
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )
    beer = brewery.beers.create!(name: "Two Hearted Ale",
                        style: "American IPA",
                        abv: 7.0,
                        ibu: 55,
                        non_alcoholic: true
                      )

    visit "/beers/#{beer.id}"

    click_link("Delete #{beer.name}")

    expect(current_path).to eq("/beers")
    expect(page).to_not have_content(beer.name)
  end
end
