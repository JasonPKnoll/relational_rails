require 'rails_helper'

RSpec.describe 'the artists show page' do

  # => Story 2
  # => As a visitor
  # => When I visit '/artists/:id'
  # => Then I see the artist with that id including the artists attributes
  it 'displays the artists specified by id and all its attributes' do
    artist = Artist.create!(name: "Povi",
                            description: "From scratch avatar creator",
                            years_experience: 10,
                            comissions_open: false)

    artist_2 = Artist.create!(name: "Lincoln",
                              description: "3D artist",
                              years_experience: 1,
                              comissions_open: false)

    visit "/artists/#{artist.id}" #localhost:3000/artist/1

    expect(page).to have_content(artist.name)
    expect(page).to have_content(artist.description)
    expect(page).to have_content(artist.years_experience)
    expect(page).to have_content(artist.comissions_open)
    expect(page).to have_content(artist.created_at)
    expect(page).to have_content(artist.updated_at)

    expect(page).to_not have_content(artist_2.name)
  end

  it 'Shows the count of artworks for artist' do

    # => Story 7
    # => As a visitor
    # => When I visit '/artists/artist_id'
    # => I see a count of the number of artworks associated with this Artist

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

    visit "/artists/#{povi.id}"

    expect(page).to have_content("Total works of art for Povi: 2")
  end

  it 'can delete Artist' do
    # User Story 19, Artist Delete (x2)
    # As a visitor
    # When I visit a artist show page
    # Then I see a link to delete the artist
    # When I click the link "Delete Artist"
    # Then a 'DELETE' request is sent to '/artists/:id',
    # the artist is deleted, and all child records are deleted
    # and I am redirected to the artist index page where I no longer see this artist

    megan = Artist.create!(name: "Megan",
                          description: "From scratch avatar creator",
                          years_experience: 2,
                          comissions_open: true)

    artwork = megan.artworks.create!(name: "Hearts",
                                    art_type: "2D digital art",
                                    price: 32,
                                    for_sale: true)

    artwork_2 = megan.artworks.create!(name: "Megonomimi",
                                      art_type: "3D Base Model",
                                      price: 45,
                                      for_sale: true)

    visit "/artists/"

    expect(page).to have_content("Megan")

    click_link "Delete Megan"

    expect(page).to_not have_content("Megan")

    visit "/artworks/"

    expect(page).to_not have_content("Hearts")
    expect(page).to_not have_content("Megonomimi")
  end
end
