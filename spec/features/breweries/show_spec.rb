require 'rails_helper'

RSpec.describe 'the brewery show page' do
  it 'displays the brewery name, location, and year_established' do
    # user story 2
    brewery = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                               multiple_brewhouses: true
                             )

    visit "/breweries/#{brewery.id}"

    expect(page).to have_content(brewery.name)
    expect(page).to have_content("Location: #{brewery.location}")
    expect(page).to have_content("Year established: #{brewery.year_established}")
    expect(page).to have_content("Multiple Brewhouses: #{brewery.multiple_brewhouses}")
  end

  it 'displays the number of beers associated with the brewery' do
    # user story 7
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
    beer2 = brewery.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0,
                        non_alcoholic: false
                      )
    visit "breweries/#{brewery.id}"

    expect(page).to have_content("Number of beers: 2")
  end

  it 'displays links to all index pages' do
    # user stories 8 and 9
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

    visit "/breweries/#{brewery.id}"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end

  it 'displays a link to the brewerys beer index page' do
    # user story 10
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
    beer2 = brewery.beers.create!(name: "Oberon Ale",
                        style: "American Pale Wheat",
                        abv: 5.8,
                        ibu: 0,
                        non_alcoholic: false
                      )
    visit "breweries/#{brewery.id}"

    expect(page).to have_link("Beer List")

    click_on("Beer List")

    expect(current_path).to eq("/breweries/#{brewery.id}/beers")
    expect(page).to have_content(beer1.name)
    expect(page).to have_content(beer2.name)
  end

  it 'has link to edit brewery and updates brewery' do
    #user story 12
    brewery = Brewery.create!(name: "Bells",
                              location: "Kalamazoo",
                              year_established: 198,
                              multiple_brewhouses: false
                            )

    visit "breweries/#{brewery.id}"

    expect(page).to have_link("Update #{brewery.name}")

    click_on("Update #{brewery.name}")

    expect(current_path).to eq("/breweries/#{brewery.id}/edit")

    fill_in('name', with: 'Bells Brewery')
    fill_in('location', with: 'Kalamazoo, MI')
    fill_in('year_established', with: 1985)
    select('Yes', :from => "multiple_brewhouses")
    click_button('Update Brewery')

    expect(current_path).to eq("/breweries/#{brewery.id}")
    expect(page).to have_content("Bells Brewery")
    expect(page).to have_content("Location: Kalamazoo, MI")
    expect(page).to have_content("Year established: 1985")
    expect(page).to have_content("Multiple Brewhouses: true")
  end

  it 'can use a button to delete a brewery' do
    #user story 19
    brewery = Brewery.create(name: "Diametric Brewing Co",
                             location: "Lee's Summit, MO",
                             year_established: 2017,
                             multiple_brewhouses: false
                           )

    visit "/breweries/#{brewery.id}"

    expect(page).to have_link("Delete #{brewery.name}")

    click_link("Delete #{brewery.name}")

    expect(current_path).to eq("/breweries")
    expect(page).to_not have_content(brewery.name)
  end
end
