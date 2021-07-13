# User Story 19, Parent Delete (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'the delete page' do
  it 'can delete a brewery' do
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
