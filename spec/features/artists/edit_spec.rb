require 'rails_helper'

RSpec.describe 'the artists edit page' do

  # User Story 12, Parent Update (x2)
  # As a visitor
  # When I visit a artist show page
  # Then I see a link to update the artist "Update Parent"
  # When I click the link "Update Parent"
  # Then I am taken to '/artists/:id/edit' where I  see a form to edit the artist's attributes:
  # When I fill out the form with updated information
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/artists/:id',
  # the artist's info is updated,
  # and I am redirected to the Parent's Show page where I see the artist's updated info

  it 'links to the edit page' do
    artist = Artist.create!(name: 'Megan')
    visit '/artists'

    click_button "Edit #{artist.name}"


    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end

  it 'can update the artists' do
    artist = Artist.create!(name: 'Meg')

    visit "/artists"

    expect(page).to have_content("Meg")

    click_button "Edit Meg"

    visit "/artists#{artist.id}/edit"

    fill_in "artists[name]", with: 'Megan'
    click_button "Update Artist"

    expect(current_path).to eq("/artists")
    expect(page).to have_content("Megan")
  end
end
