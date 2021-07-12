# User Story 12, Parent Update (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
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
    save_and_open_page
    expect(current_path).to eq("/breweries/#{brewery.id}")
    expect(page).to have_content("Sierra Nevada Brewing Co")
    expect(page).to have_content("Location: Chico, CA")
    expect(page).to have_content("Year established: 1980")
    expect(page).to have_content("Multiple Brewhouses: true")
  end
end
