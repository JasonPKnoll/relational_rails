require 'rails_helper'

RSpec.describe 'the brewery index page' do
  it 'displays the brewery names' do
    # user story 1
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

  it 'displays breweries sorted by most recently created, showing created at data' do
    # user story 6
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

    expect(brewery3.name).to appear_before(brewery2.name)
    expect(brewery2.name).to appear_before(brewery1.name)
  end

  it 'displays links to all index pages' do
    # user stories 8 and 9
    visit "/breweries"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end

  it 'displays link to add a new brewery' do
    #user story 11
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

    click_on("New Brewery")

    expect(current_path).to eq("/breweries/new")

    fill_in('name', with: 'New Glarus Brewing')
    fill_in('location', with: 'New Glarus, WI')
    fill_in('year_established', with: 1993)
    page.choose('multiple_brewhouses', with: false)
    click_button('Create Brewery')

    expect(current_path).to eq('/breweries')
    expect(page).to have_content('New Glarus Brewing')
  end

  it 'has a link to update brewery for every brewery on page' do
    #user story 17
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
    visit '/breweries'
  
    expect(page).to have_link("Update #{brewery1.name}")

    click_link("Update #{brewery1.name}")

    expect(current_path).to eq("/breweries/#{brewery1.id}/edit")

    visit '/breweries'

    expect(page).to have_link("Update #{brewery2.name}")

    click_link("Update #{brewery2.name}")

    expect(current_path).to eq("/breweries/#{brewery2.id}/edit")
  end
end
