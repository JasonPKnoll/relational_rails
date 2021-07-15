require 'rails_helper'

RSpec.describe 'brewerys beer creation page' do
  it 'links to the creation page' do
    brewery1 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )

    visit "/breweries/#{brewery1.id}/beers"

    click_link("Create Beer")

    expect(current_path).to eq("/breweries/#{brewery1.id}/beers/new")
  end

  it 'can create new beer' do
    brewery1 = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )

    visit "/breweries/#{brewery1.id}/beers/new"

    fill_in('name', with: 'Two Hearted Ale')
    fill_in('style', with: 'American IPA')
    fill_in('abv', with: 7.0)
    fill_in('ibu', with: 55)
    select('No', :from => "non_alcoholic")

    click_button('Create Beer')

    expect(current_path).to eq("/breweries/#{brewery1.id}/beers")
    expect(page).to have_content('Two Hearted Ale')
    expect(page).to have_content('Style: American IPA')
    expect(page).to have_content('ABV(%): 7.0')
    expect(page).to have_content('IBU: 55')
    expect(page).to have_content('Non Alcoholic: false')
  end

  it 'displays links to all index pages' do
    # user stories 8 and 9
    brewery = Brewery.create!(name: "Bells Brewery",
                              location: "Kalamazoo, MI",
                              year_established: 1985,
                              multiple_brewhouses: true
                            )

    visit "/breweries/#{brewery.id}/beers/new"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end
end
