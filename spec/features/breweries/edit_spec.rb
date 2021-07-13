require 'rails_helper'

RSpec.describe 'brewery edit page' do
  it 'links to the edit page' do
    brewery = Brewery.create!(name: "Sierra Nevada Brewing Co",
                               location: "Chico, CA",
                               year_established: 1980,
                               multiple_brewhouses: true
                             )
    visit '/breweries'

    click_link ("Update #{brewery.name}")

    expect(current_path).to eq("/breweries/#{brewery.id}/edit")
  end

  it 'can edit the brewery' do
    brewery = Brewery.create!(name: "Sierra Nevada",
                               location: "Chico",
                               year_established: 198,
                               multiple_brewhouses: false
                             )

    visit "/breweries/"

    expect(page).to have_link("Update Sierra Nevada")

    click_link("Update Sierra Nevada")

    fill_in('name', with: 'Sierra Nevada Brewing Co')
    fill_in('location', with: 'Chico, CA')
    fill_in('year_established', with: 1980)
    page.choose('multiple_brewhouses', with: true)
    click_button('Update Brewery')

    expect(current_path).to eq("/breweries/#{brewery.id}")
    expect(page).to have_content("Sierra Nevada Brewing Co")
    expect(page).to have_content("Location: Chico, CA")
    expect(page).to have_content("Year established: 1980")
    expect(page).to have_content("Multiple Brewhouses: true")
  end

  it 'displays links to all index pages' do
    # user stories 8 and 9
    brewery = Brewery.create!(name: "Sierra Nevada",
                               location: "Chico",
                               year_established: 198,
                               multiple_brewhouses: false
                             )
                             
    visit "/breweries/#{brewery.id}/edit"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end
end
