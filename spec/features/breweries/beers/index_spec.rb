require 'rails_helper'

RSpec.describe "Brewery's beers index page" do
  it 'displays the beers associated with that brewery and the beers attributes' do
    #user story 5
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

  it 'displays links to all index pages' do
    # user stories 8 and 9
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )

    visit "/breweries/#{brewery.id}/beers"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end

  it 'links to the the create beer page, creates new beer, and redirects to the brewerys beer index page' do
    #user story 13
    brewery1 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )

    visit "/breweries/#{brewery1.id}/beers"

    click_link("Create Beer")

    expect(current_path).to eq("/breweries/#{brewery1.id}/beers/new")

    fill_in('name', with: 'Two Hearted Ale')
    fill_in('style', with: 'American IPA')
    fill_in('abv', with: 7.0)
    fill_in('ibu', with: 55)
    page.choose('non_alcoholic', with: false)
    click_button('Create Beer')

    expect(current_path).to eq("/breweries/#{brewery1.id}/beers")
    expect(page).to have_content('Two Hearted Ale')
    expect(page).to have_content('Style: American IPA')
    expect(page).to have_content('ABV(%): 7.0')
    expect(page).to have_content('IBU: 55')
    expect(page).to have_content('Non Alcoholic: false')
  end

  it 'has a link that sorts page by alphabetical order' do
    #user story 16
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

  it 'has a link to delete beer next to every beer on page, can delete any beer, and redirects to beers index page' do
    #user story 23 - part 2
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
                        non_alcoholic: false
                      )

    visit "/breweries/#{brewery.id}/beers"

    expect(page).to have_link("Delete #{beer1.name}")
    expect(page).to have_link("Delete #{beer2.name}")

    click_link("Delete #{beer1.name}")

    expect(current_path).to eq("/beers")
    expect(page).to_not have_content(beer1.name)

    visit "/breweries/#{brewery.id}/beers"

    click_link("Delete #{beer2.name}")

    expect(current_path).to eq("/beers")
    expect(page).to_not have_content(beer2.name)
  end
end
