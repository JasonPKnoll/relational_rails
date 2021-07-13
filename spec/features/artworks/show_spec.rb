require 'rails_helper'

RSpec.describe 'the artworks show page' do
  before(:each) do
    @povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    @artwork = @povi.artworks.create!(name: "Povichi",
                                    art_type: "3D Base Model",
                                    price: 32,
                                    for_sale: true)

    @artwork_2 = @povi.artworks.create!(name: "Kemonomimi",
                                      art_type: "3D Base Model",
                                      price: 45,
                                      for_sale: true)
  end

  # => Story 4
  # => As a visitor
  # => When I visit '/artworks/:id'
  # => Then I see the artwork with that id including the artworks attributes:
  it 'displays the artwork specified by id and all accosiated attributes' do

    visit "/artworks/#{@artwork.id}" #localhost:3000/artwork

    expect(page).to have_content(@artwork.name)
    expect(page).to have_content(@artwork.art_type)
    expect(page).to have_content(@artwork.price)
    expect(page).to have_content(@artwork.for_sale)
    expect(page).to have_content(@artwork.created_at)
    expect(page).to have_content(@artwork.updated_at)

    expect(page).to_not have_content(@artwork_2.name)
  end

  # User Story 14, Child Update (x2)
  # As a visitor
  # When I visit a Artwork Show page
  # Then I see a link to update that Artwork "Update Artwork"
  # When I click the link
  # I am taken to '/artworks/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Artwork"
  # Then a `PATCH` request is sent to '/artworks/:id',
  # the child's data is updated,
  # and I am redirected to the Artwork Show page where I see the Artwork's updated information

  it 'link to artwork edit page' do

    visit "/artworks/#{@artwork.id}"

    click_button "Update #{@artwork.name}"

    expect(current_path).to eq("/artworks/#{@artwork.id}/edit")
  end

  it 'edits artwork and returns to artwork show page' do

    visit "/artworks/#{@artwork.id}/edit"

    fill_in "name", with: "Povichi V2"

    click_button "Update Artwork"

    expect(current_path).to eq("/artworks/#{@artwork.id}")
    expect(page).to have_content("Povichi V2")
  end
end
