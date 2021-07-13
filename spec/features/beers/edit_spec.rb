require 'rails_helper'

RSpec.describe 'beers edit page' do
  it 'can update the beer' do
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

    visit "/beers/#{beer.id}/edit"

    fill_in('name', with: 'Big Gay IPA')
    fill_in('style', with: 'American IPA')
    fill_in('abv', with: 5.0)
    fill_in('ibu', with: 50)
    page.choose('non_alcoholic', with: false)
    click_button('Update Beer')

    expect(current_path).to eq("/beers/#{beer.id}")
    expect(page).to have_content("Style: American IPA")
    expect(page).to have_content("ABV(%): 5.0")
    expect(page).to have_content("IBU: 50")
    expect(page).to have_content("Non Alcoholic: false")
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

    visit "/beers/#{beer.id}/edit"

    expect(page).to have_link("Brewery Index")
    expect(page).to have_link("Beer Index")
    expect(page).to have_link("Artist Index")
    expect(page).to have_link("Artwork Index")
  end
end
