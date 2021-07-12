require 'rails_helper'

RSpec.describe 'beers edit page' do
  it 'links to the edit page' do
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

    expect(page).to have_link("Update #{beer.name}")

    click_link("Update #{beer.name}")

    expect(current_path).to eq("/beers/#{beer.id}/edit")
  end

  it 'can edit the beer' do
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

    click_link("Update Gay IPA")

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
end
