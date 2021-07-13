require 'rails_helper'

RSpec.describe 'the artworks index page' do

  # => Story 3
  # => As a visitor
  # => When I visit '/artworks/'
  # => Then I see each artwork in the system including the artworks attributes:
  it 'displays the artworks name' do
    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    artwork = povi.artworks.create!(name: "Povichi",
                                    art_type: "3D Base Model",
                                    price: 32,
                                    for_sale: true)

    visit "/artworks" #localhost:3000/artwork

    expect(page).to have_content(artwork.name)
    expect(page).to have_content(artwork.art_type)
    expect(page).to have_content(artwork.price)
    expect(page).to have_content(artwork.for_sale)
    expect(page).to have_content(artwork.created_at)
    expect(page).to have_content(artwork.updated_at)
  end

  it 'displays artworks index link on all pages' do

    # => Story 8
    # => As a visitor
    # => When I visit any page
    # => I see a link at the top of the page that takes me to artworks index
    visit "/" # welcome page
    expect(page).to have_link("Artworks Index")

    visit "/artworks"
    expect(page).to have_link("Artworks Index")

    visit "/artists"
    expect(page).to have_link("Artworks Index")

    visit "/easteregg"
    expect(page).to have_link("Artworks Index")
  end

  it 'only shows records where for sale is true' do
    # User Story 15, Child Index only shows `true` Records (x2)
    # As a visitor
    # When I visit the artworks index
    # Then I only see records where the boolean column is `true`

    povi = Artist.create!(name: "Povi",
                          description: "From scratch avatar creator",
                          years_experience: 10,
                          comissions_open: false)

    artwork = povi.artworks.create!(name: "Povichi V2",
                                    art_type: "3D Base Model",
                                    price: 35,
                                    for_sale: true)

    artwork_2 = povi.artworks.create!(name: "Kemonomimi V2",
                                      art_type: "3D Base Model",
                                      price: 50,
                                      for_sale: false)

    visit "/artworks/"

    expect(page).to_not have_content("Kemonomimi V2")
  end
end
