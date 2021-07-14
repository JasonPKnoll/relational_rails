# User Story 20, Child Delete (x2)
#
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
require 'rails_helper'

RSpec.describe 'delete action' do
  it 'can delete a beer' do
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

    expect(page).to have_link("Delete #{beer.name}")

    click_link("Delete #{beer.name}")

    expect(current_path).to eq("/beers")
    expect(page).to_not have_content(beer.name)
  end
end
