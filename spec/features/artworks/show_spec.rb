require 'rails_helper'

RSpec.describe 'the artworks show page' do

  # => Story 4
  # => As a visitor
  # => When I visit '/artworks/:id'
  # => Then I see the artwork with that id including the artworks attributes:
  it 'displays the artwork specified by id and all accosiated attributes' do
    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    artwork = povi.artworks.create!(name: "Povichi",
                                    art_type: "3D Base Model",
                                    price: 32,
                                    for_sale: true)

    artwork_2 = povi.artworks.create!(name: "Kemonomimi",
                                      art_type: "3D Base Model",
                                      price: 45,
                                      for_sale: true)

    visit "/artworks/#{artwork.id}" #localhost:3000/artwork

    expect(page).to have_content(artwork.name)
    expect(page).to have_content(artwork.art_type)
    expect(page).to have_content(artwork.price)
    expect(page).to have_content(artwork.for_sale)
    expect(page).to have_content(artwork.created_at)
    expect(page).to have_content(artwork.updated_at)

    expect(page).to_not have_content(artwork_2.name)
  end
end
